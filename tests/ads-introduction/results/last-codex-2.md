Saved the Introduction to [draft.md](/Users/inertia/Desktop/www/tests/ads-introduction/draft.md). Kept all three relations as written and marked the Introduction `drafted` in [design.md](/Users/inertia/Desktop/www/tests/ads-introduction/design.md).

Self-check: no changes needed. Independent check: no mismatches found. Mechanical checks passed: all twelve claims are present, local deployment and necessity are preserved, and nothing appears between the research question and ADS.

**Introduction**

Translation technology has advanced. However, existing translation services have cost and security issues. Therefore, small, domain-specific translation models that can run locally must be developed.

Training such models requires parallel data. However, constructing parallel data manually is difficult. An alternative source of supervision is therefore needed. Teacher LLMs can meet this need by providing high-quality translation supervision. However, using them for the entire dataset is expensive. Yet even a small amount of high-quality parallel data can improve a student model’s translation performance. Given a limited teacher annotation budget, which source sentences should therefore be selected for teacher annotation?

To address this question, we propose QE-guided Active Data Selection (ADS). Under ADS, the student’s translations are evaluated using a QE model, and sentences with low QE scores are selected first.

**한국어 설명**

번역 기술은 발전했지만, 기존 번역 서비스에는 비용과 보안 문제가 있습니다. 따라서 로컬에서 실행할 수 있는 작은 도메인 특화 번역 모델을 개발해야 한다는 필요성을 제시합니다.

이러한 모델을 학습하려면 병렬 데이터가 필요하지만, 사람이 직접 만들기는 어렵습니다. 그래서 다른 학습 신호 공급원이 필요하며, Teacher LLM은 양질의 번역 학습 신호를 제공할 수 있습니다. 그러나 전체 데이터에 Teacher LLM을 사용하는 것은 비용이 큽니다. 한편 소량의 고품질 병렬 데이터만으로도 student 모델의 번역 성능을 개선할 수 있으므로, 제한된 예산을 어떤 원문 문장에 써야 하는지 묻습니다.

이 질문에 대응하는 방법으로 QE-guided ADS를 제안합니다. ADS에서는 student의 번역을 QE 모델로 평가하고, QE 점수가 낮은 문장을 우선 선택합니다.

한국어 설명도 기록과 대조해, 기록에 없는 주장이 들어가지 않았음을 확인했습니다.