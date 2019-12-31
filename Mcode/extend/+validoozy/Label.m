classdef Label
    % Label Indicates labels describing input arguments to validators
    %
    % Label is a simple object that holds an array of string labels, and
    % can be passed in to validator functions to indicate lables to be used
    % for other inputs in diagnostic messages. It is effectively a marker
    % interface that indicates that an argument is to be used as a label
    % for other validated arguments, rather than something to be validated
    % itself.
    
    properties
        label
    end
    
    methods
        function this = Label(in)
            % Label Construct a new Label array
            %
            % obj = validoozy.Label(str)
            %
            % str may be a char, cellstr, or string array.
            if nargin == 0
                return
            end
            labels = cellstr(in);
            this = repmat(this, size(labels));
            for i = 1:numel(labels)
                this(i).label = labels{i};
            end
        end
        
        function disp(this)
            % disp Custom display
            if isscalar(this)
                fprintf('Label: ''%s''', this.label);
            else
                fprintf('%s %s', size2str(size(this)), class(this));
            end
        end
        
        function out = labels(this)
            % labels Get all the labels in this array as cellstr
            %
            % Extracts all the labels in this into a cellstr array. This is
            % a convenient
            out = cell(size(this));
            for i = 1:numel(this)
                out{i} = this(i).label;
            end
        end
    end
end