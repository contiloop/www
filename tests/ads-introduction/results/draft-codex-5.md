# Introduction

Translation technology has advanced. However, existing translation services have cost and security issues. These issues make it necessary to develop small, domain-specific translation models that can run locally.

Training such models requires parallel data. However, constructing parallel data manually is difficult. An alternative source of supervision is therefore needed. Teacher LLMs can supply this supervision by generating high-quality translations. However, applying them to the entire dataset is expensive. Yet even a small amount of high-quality parallel data can improve the student's translation performance. With a limited teacher annotation budget, which source sentences should therefore be selected for teacher translation?

To address this question, we propose QE-guided Active Data Selection (ADS). In this method, the student's translations are evaluated with a QE model, and sentences with low QE scores are prioritized.
