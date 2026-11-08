## Introduction

Translation technology has advanced. However, using existing translation services poses cost and security problems. A small, domain-specific translation model that can run locally must therefore be developed.

Training such a model requires parallel data. Constructing parallel data manually, however, is difficult. An alternative source of supervision is therefore needed. This need motivates the use of Teacher LLMs, which can provide high-quality translation supervision. But applying them to the entire dataset is expensive. Yet even a small amount of high-quality parallel data can improve translation performance.

Which sentences, then, should receive the teacher's annotation budget when that budget is limited? To address this question, we propose QE-guided Active Data Selection (ADS). Under ADS, a sentence is selected first when a QE model gives the student model's translation of it a low score.
