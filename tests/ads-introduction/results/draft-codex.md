# Introduction

Translation technology has advanced. However, existing translation services have cost and security issues. Therefore, small, domain-specific translation models that can run locally must be developed.

Training such models requires parallel data. However, constructing parallel data manually is difficult. An alternative source of supervision is therefore needed. Teacher LLMs can meet this need by providing high-quality translation supervision. However, using them to translate the entire dataset is expensive. Yet even a small amount of high-quality parallel data can improve the student model’s translation performance.

With a limited teacher annotation budget, which source sentences should be selected for the teacher to translate? To address this question, we propose QE-guided Active Data Selection (ADS). ADS evaluates the student’s translations with a QE model and prioritizes sentences with low QE scores.
