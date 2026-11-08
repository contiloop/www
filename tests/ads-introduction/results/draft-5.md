# Introduction

Translation technology has advanced. However, existing services have cost and security issues. Therefore, a small, domain-specific translation model that can run locally must be developed.

Training such a model requires parallel data. Having people construct parallel data, however, is difficult. Another source of supervision is therefore needed. Teacher LLMs can provide this supervision at high quality. Applying them to the entire dataset, however, is expensive. Yet even a small amount of high-quality parallel data can improve the model's translation performance.

Which sentences, then, should receive the teacher's annotation budget when that budget is limited? To answer this question, we propose QE-guided Active Data Selection (ADS). ADS evaluates the model's translations with a QE model and selects the sentences with low QE scores first.
