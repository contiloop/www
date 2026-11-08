## Introduction

Translation technology has advanced. However, using existing translation services raises cost and security issues. Small, domain-specific translation models that can run locally must therefore be developed.

Training such models requires parallel data. Constructing parallel data manually, however, is difficult, so an alternative source of supervision is needed. Teacher LLMs are such a source, since they can provide high-quality supervision. However, applying them to the entire dataset is expensive. Yet even a small amount of high-quality data can improve the performance of the model being trained.

Which sentences, then, should receive the teacher's annotation budget when that budget is limited? To answer this question, we propose QE-guided Active Data Selection (ADS). ADS evaluates the student model's translations with a QE model and prioritizes the sentences with low QE scores.
