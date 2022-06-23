% Test FastGCN with benchmark datasets.

clear all;
addpath(genpath('../nn'));
RandStream.setGlobalStream(RandStream('mt19937ar','Seed',1));

%------------------------------------------------------------------------------
% dataset: cora
%%{
% Load in data
data_path = '../data';
data_name = 'data';
%data_name = 'pubmed';
load([data_path '/' data_name]);


num_epoch = 20;        % Number of epochs
d2 = 256;               % Number of hidden units
learning_rate = 1e-1;  % The alpha parameter in the ADAM optimizer
l2_reg = 0;            % L2 regularization weight
%batch_size = 256;      % Batch size. If empty, equivalent to GCN w/o batching
batch_size = [];
%sample_size = 400;     % Sample size. If empty, equivalent to batched GCN
sample_size = [];
%%}
%------------------------------------------------------------------------------
% dataset: pubmed
%{
% Load in data
data_path = '../data';
data_name = 'pubmed';
load([data_path '/' data_name]);

% Hyperparameters
num_epoch = 20;        % Number of epochs
d2 = 16;               % Number of hidden units
learning_rate = 1e-1;  % The alpha parameter in the ADAM optimizer
l2_reg = 0;            % L2 regularization weight
batch_size = 1024;     % Batch size. If empty, equivalent to GCN w/o batching
%batch_size = [];
sample_size = 400;     % Sample size. If empty, equivalent to batched GCN
%sample_size = [];
%}
%------------------------------------------------------------------------------

% Already have A as a sparse matrix. Only need normalization.
A = normalizeSparseA(A);

% Extract dimensions
n = size(A,1);       % Number of graph nodes
ntrain = size(y,1);  % Number of training nodes
%ntest = size(ty,1);  % Number of test nodes
d = size(x,2);       % Feature dimension
c = size(y,2);       % Number of classes
szW0 = [d,d2];       % Size of parameter matrix W0
szW1 = [d2,c];       % Size of parameter matrix W1

% Assemble X
X=x;

% Assemble Y
Y=y;


idx_train = 1 : n;
idx_valid = 0;
idx_test = 0;

% ntrain is no longer correct under FastGCN split. Use length() to
% get the correct ntrain, nvalid, and ntest.

% Normalize X
X = normalizeX(X);

% Initialize ADAM
num_var = prod(szW0) + prod(szW1);
adam_param = adam_init(num_var, learning_rate);

% Print info
fprintf('Data set: %s\n', data_name);
fprintf('split: %d/%d/%d\n', ...
        length(idx_train), length(idx_valid), length(idx_test));
fprintf('num_epoch %d\n', num_epoch);
fprintf('hidden_size %d\n', d2);
fprintf('learning_rate %g\n', learning_rate);
fprintf('l2_regularization %g\n', l2_reg);
if isempty(batch_size)
  fprintf('batch_size []\n');
else
  fprintf('batch_size %d\n', batch_size);
end
if isempty(sample_size)
  fprintf('sample_size []\n');
else
  fprintf('sample_size %d\n', sample_size);
end

% Run
%figure(2);
model_fastgcn_train_and_test(A, X, Y, idx_train, idx_valid, idx_test, ...
                             szW0, szW1, l2_reg, num_epoch, batch_size, ...
                             sample_size, adam_param);
