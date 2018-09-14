function [newSignal] = smoothByWindow(signal,window)

newSignalLength = (length(signal) + length(window) - 1) ; 

newSignal = zeros(1,newSignalLength);

newLimits = zeros(1, (length(window) - 1) ); % making  the boundaries

oldSignal = [newLimits , signal, newLimits]; % making a new vector of signal + boundarings

for n = 1 : length(newSignal)
        newSignal(n) = sum( oldSignal( n : (n+length(window)-1) ) .* window );
end

newSignal = newSignal( length(window) : length(newSignal) );
    