function [acHOGFeaturesCulled,acHOGFeaturesFlippedCulled] = ...
  fnCullExemplarsFromSMTracks(acHOGFeatures, ...
                              acA,acB, ...
                              iMaxNumExemplars, ...
                              acHOGFeaturesFlipped)

                   
% Like fnCullExemplarsFromSMTrack(), but works on a number of single-mouse
% clips.  Essentially just calls fnCullExemplarsFromSMTrack() on each
% element of acHOGFeatures, acA, acB, and acHOGFeaturesFlipped, and
% packages the results into the cell arrays acHOGFeaturesCulled and 
% acHOGFeaturesFlippedCulled.
                            
iNumMice=length(acHOGFeatures);
acHOGFeaturesCulled=cell(iNumMice,1);
if nargout>=2
  acHOGFeaturesFlippedCulled=cell(iNumMice,1);
end 
for i=1:iNumMice
  if nargout<=1
    acHOGFeaturesCulled{i}= ...
      fnCullExemplarsFromSMTrack(acHOGFeatures{i}, ...
                                 acA{i},acB{i}, ...
                                 iMaxNumExemplars);
  else
    [acHOGFeaturesCulled{i},acHOGFeaturesFlippedCulled{i}]= ...
      fnCullExemplarsFromSMTrack(acHOGFeatures{i}, ...
                                 acA{i},acB{i}, ...
                                 iMaxNumExemplars, ...
                                 acHOGFeaturesFlipped{i});
  end
end

end

