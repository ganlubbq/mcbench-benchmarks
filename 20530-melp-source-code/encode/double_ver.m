function cor_p=double_ver(sig_in,pp,cor_p)
% �������� ������� ��  
% ������� ����������: 
%   sig_in - ������� ������
%   pp     - �������� ��
%   cor_p  - ���������� 
% �������� ����������:  
% cor_p    - �������� ���������� 

[np,ncor_p]=fpr(sig_in,round(2*pp)); % ���������� ���������� ��� 
                                     % ���������� �������� �� 
if ncor_p<cor_p    % ���� ������������ �������� ���������� ������ �������,
    cor_p=ncor_p;  % �� ��� ������������� ��������
end