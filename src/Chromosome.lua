local mathRandom = math.random

local Chromosome = {}

function Chromosome.new(parameterDictionary)

	parameterDictionary = parameterDictionary or {}

	local self = setmetatable({}, Chromosome)

	local geneArray = parameterDictionary.geneArray or parameterDictionary[1] or {}
	
	local activationFunction = parameterDictionary.activationFunction or parameterDictionary[2] or function(...) return ... end
	
	local mutationChance = parameterDictionary.mutationChance or parameterDictionary[3] or 0

	return self

end

function Chromosome:mutate(forceMutateChromosome, forceMutateGene)
	
	if (not forceMutateChromosome) and (self.mutationChance <= mathRandom()) then return end
	
	for i, Gene in ipairs(self.geneArray) do Gene:mutate(forceMutateGene) end
	
end

function Chromosome:activate()
	
	local valueArray = {}
	
	for i, Gene in ipairs(self.geneArray) do valueArray[i] = Gene.value end
	
	return self.activationFunction(table.unpack(valueArray))
	
end
	
return Chromosome
