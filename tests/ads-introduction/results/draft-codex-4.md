# Introduction

Translation technology has advanced. However, existing translation services have cost and security issues. Therefore, small, locally deployable, domain-specific translation models must be developed.

Training these models requires parallel data. Yet constructing parallel data manually is difficult. An alternative source of supervision is therefore needed. Teacher large language models (LLMs) can meet this need by providing high-quality translation supervision. However, using them for the entire dataset is expensive. Nevertheless, even a small amount of high-quality parallel data can improve a student model's translation performance.

Under a limited teacher annotation budget, which source sentences should be selected for teacher translation? To answer this question, we propose QE-guided Active Data Selection (ADS). In ADS, a quality estimation (QE) model evaluates the student's translations, and sentences with low QE scores are prioritized for selection.
