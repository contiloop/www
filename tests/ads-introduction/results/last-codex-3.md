Saved [draft.md](/Users/inertia/Desktop/www/tests/ads-introduction/draft.md). The three relations remain as written; their pending proposal is resolved, and the Introduction is marked `drafted`.

Self-check: all twelve claims preserved in order, with no changes needed. Independent check: no mismatches found.

**Introduction**

Translation technology has advanced. However, existing translation services have cost and security issues. Small, domain-specific translation models that can run locally must therefore be developed.

Training such models requires parallel data. However, constructing parallel data manually is difficult. An alternative source of supervision is therefore needed, and teacher LLMs can meet this need by providing high-quality translation supervision. However, using teacher LLMs to translate the entire dataset is expensive. Yet even a small amount of high-quality parallel data can improve the student model’s translation performance.

This raises the question: under a limited teacher annotation budget, which source sentences should be selected for teacher translation? To address this question, we propose QE-guided Active Data Selection (ADS). In ADS, the student model’s translations are evaluated by a QE model, and sentences with low QE scores are prioritized for selection.

**한국어 설명**

번역 기술은 발전했지만 기존 번역 서비스에는 비용과 보안 문제가 있으므로, 로컬에서 실행할 수 있는 작은 도메인 특화 번역 모델을 개발해야 한다는 주장으로 시작합니다.

이 모델을 학습하려면 병렬 데이터가 필요하지만 사람이 직접 만들기는 어렵습니다. 따라서 다른 학습 신호 공급원이 필요하며, Teacher LLM은 양질의 번역을 제공할 수 있습니다. 그러나 전체 데이터를 Teacher LLM으로 번역하는 데는 비용이 큽니다. 한편 소량의 고품질 병렬 데이터만으로도 student의 번역 성능을 개선할 수 있습니다.

여기서 “제한된 teacher 예산으로 어떤 원문 문장을 번역하게 할 것인가?”라는 연구 질문을 제시합니다. 이어서 제안하는 방법인 QE-guided ADS를 소개합니다. ADS는 student의 번역을 QE 모델로 평가하고, QE 점수가 낮은 문장을 우선 선택합니다.