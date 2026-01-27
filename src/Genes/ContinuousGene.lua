--[[

	--------------------------------------------------------------------

	Aqwam's Genetic Evolution Library (DataPredict Genetics)

	Author: Aqwam Harish Aiman
	
	Email: aqwam.harish.aiman@gmail.com
	
	YouTube: https://www.youtube.com/channel/UCUrwoxv5dufEmbGsxyEUPZw
	
	LinkedIn: https://www.linkedin.com/in/aqwam-harish-aiman/
	
	--------------------------------------------------------------------
		
	By using this library, you agree to comply with our Terms and Conditions in the link below:
	
	https://github.com/AqwamCreates/DataPredict-Genetics/blob/main/docs/TermsAndConditions.md
	
	--------------------------------------------------------------------
	
	DO NOT REMOVE THIS TEXT!
	
	--------------------------------------------------------------------

--]]

local ContinuousGene = {}

function ContinuousGene.new(parameterDictionary)

	parameterDictionary = parameterDictionary or {}

	local self = setmetatable({}, ContinuousGene)

	self.value = parameterDictionary.value or parameterDictionary[1] or 0

	self.mutationChance = parameterDictionary.mutationChance or parameterDictionary[2] or 0

	self.mutationStandardDeviation = parameterDictionary.mutationStandardDeviation or parameterDictionary[3] or 1

	return self

end

local DiscreteGene = {}

function DiscreteGene.new(parameterDictionary)

	parameterDictionary = parameterDictionary or {}

	local self = setmetatable({}, DiscreteGene)

  local value = parameterDictionary.value or parameterDictionary[1] or 0

  local mutationChoiceArray =  parameterDictionary.mutationChoiceArray or parameterDictionary[3] or {value}

  local numberOfMutationChoices = #mutationChoiceArray

	self.value = value
  
	self.mutationChance = parameterDictionary.mutationChance or parameterDictionary[2] or 0

	self.mutationChoiceArray = mutationChoiceArray

  self.mutationWeightArray = parameterDictionary.mutationWeightArray or parameterDictionary[4] or table.create(numberOfMutationChoices, (1/numberOfMutationChoices))

	return self

end
