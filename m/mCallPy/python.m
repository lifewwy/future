function [result ,status] = python(varargin)
% call python
%�����ַ���
cmdString='python';
for i = 1:nargin
    thisArg = varargin{i};
    if isempty(thisArg) || ~ischar(thisArg)
        error('All input arguments must be valid strings.');
    elseif exist(thisArg)==2
        %����һ����Matlab·���еĿ��õ��ļ�
        if isempty(dir(thisArg))
            %�õ�����·��
            thisArg = which(thisArg);
        end
    elseif i==1
        % ��һ��������Python�ļ� - ������һ�����õ��ļ�
        error(['Unable to find Python file: ', thisArg]);
    end
    % ���thisArg���пո񣬾���˫���Ű���������
    if any(thisArg == ' ')
          thisArg = ['"', thisArg, '"'];
    end
    % ��thisArg����cmdString����
    cmdString = [cmdString, ' ', thisArg]
end
%��������
[status,result]=system(cmdString);
end



