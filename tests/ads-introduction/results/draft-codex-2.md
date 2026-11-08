# Introduction

Translation technology has advanced. However, existing translation services have cost and security issues. Therefore, small, domain-specific translation models that can run locally must be developed.

Training such models requires parallel data. However, constructing parallel data manually is difficult. An alternative source of supervision is therefore needed. Teacher LLMs can meet this need by providing high-quality translation supervision. However, using them for the entire dataset is expensive. Yet even a small amount of high-quality parallel data can improve a student model's translation performance. Given a limited teacher annotation budget, which source sentences should therefore be selected for teacher annotation?

To address this question, we propose QE-guided Active Data Selection (ADS). Under ADS, the student's translations are evaluated using a QE model, and sentences with low QE scores are selected first.
