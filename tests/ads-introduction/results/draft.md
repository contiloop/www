## Introduction

Translation technology has advanced. However, existing services come with cost and security problems. Therefore, small, domain-specific translation models that can run locally must be developed.

Training such a model requires parallel data. However, constructing parallel data manually is difficult. Therefore, another source of supervision must be found. Teacher LLMs can provide high-quality translation supervision. Applying them to the entire dataset, however, is expensive. Yet even a small amount of high-quality parallel data can improve the student model's translation performance.

Which sentences, then, should receive the teacher's limited annotation budget? To answer this question, we propose QE-guided Active Data Selection (ADS). ADS evaluates the student model's translations with a QE model and selects the sentences with low QE scores first.
