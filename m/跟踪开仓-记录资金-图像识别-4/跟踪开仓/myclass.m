classdef myclass 
    properties
        a1 = 10
        a2 = 200
    end
    methods
        % 构造方法
        function obj = myclass(x,y)
            obj.a1 = x;
            obj.a2 = y;
        end
        
    end
end
