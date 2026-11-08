# Introduction

Translation technology has advanced. However, existing services have cost and security issues. Small, domain-specific translation models that can run locally must therefore be developed.

Training such models requires parallel data, but having people construct parallel data is difficult. An alternative source of supervision is therefore needed. Teacher LLMs are such a source, since they can provide high-quality translation supervision. However, applying them to the entire dataset is expensive. Yet even a small amount of high-quality parallel data can improve the translation performance of such models.

Which sentences, then, should receive the teacher's annotation budget when that budget is limited? To answer this question, we propose QE-guided Active Data Selection (ADS). ADS evaluates the translations of the model being trained with a quality estimation (QE) model and selects a sentence first when its QE score is low.
