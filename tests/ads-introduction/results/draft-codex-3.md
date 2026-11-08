# Introduction

Translation technology has advanced. However, existing translation services have cost and security issues. Small, domain-specific translation models that can run locally must therefore be developed.

Training such models requires parallel data. However, constructing parallel data manually is difficult. An alternative source of supervision is therefore needed, and teacher LLMs can meet this need by providing high-quality translation supervision. However, using teacher LLMs to translate the entire dataset is expensive. Yet even a small amount of high-quality parallel data can improve the student model’s translation performance.

This raises the question: under a limited teacher annotation budget, which source sentences should be selected for teacher translation? To address this question, we propose QE-guided Active Data Selection (ADS). In ADS, the student model’s translations are evaluated by a QE model, and sentences with low QE scores are prioritized for selection.
