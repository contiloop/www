## Introduction

Translation technology has advanced. However, existing translation services have cost and security issues. A small, domain-specific translation model that can run locally must therefore be developed.

Training such a model requires parallel data, but constructing parallel data by hand is difficult. Another source of supervision is therefore needed. Teacher LLMs can provide high-quality translation supervision. However, applying them to the entire dataset is expensive. Yet even a small amount of high-quality parallel data can improve the translation performance of the small model.

Which sentences, then, should receive the teacher's annotation budget when that budget is limited? To answer this question, we propose QE-guided Active Data Selection (ADS). ADS evaluates the small model's translations with a QE model and selects the sentences with low QE scores first.
