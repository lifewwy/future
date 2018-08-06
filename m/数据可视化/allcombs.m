function C = allcombs(varargin)
n = nargin;
if n < 2, error('Insufficient input'); end
s = '[x1';
for i=2:n
    s = [s sprintf(',x%i',i)];
end
s = [s ']=ndgrid(varargin{:});'];
eval(s);
s = '[x1(:)';
for i=2:n
    s = [s sprintf(',x%i(:)',i)];
end
s = [s ']'];
C = eval(s);