function P = forward_softmax(X, which_dim)
% P = softmax(Y, which_dim)

%max(A,[],dim)������A����dimָ����ά����Χ�е����ֵ��dimȡ1ʱ����ÿ�����ֵ��dimȡ2ʱ����ÿ�����ֵ
%expX = exp(X - max(X,[],which_dim)); % Use shifts to ensure numerical stability
%------------�Լ��ӵģ�����./����---
TempMax=max(X,[],which_dim);
[r,h]=size(X);
TempA=ones(1,h);
TempMax=TempMax*TempA;
%---------
expX = exp(X - TempMax); % Use shifts to ensure numerical stability

%P = expX ./ sum(expX, which_dim);

P = expX ./ TempSum;
P = P + eps; % Avoid explicit zero ����ĳһ����N����С����������,һ�����ڷ�ĸ�ϣ���ֹ��ĸ����0

