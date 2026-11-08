Saved the Introduction to [draft.md](/Users/inertia/Desktop/www/tests/ads-introduction/draft.md). Kept the three relations—“C4 → C5 by contrast,” “C6 → C7 by cause,” and “C11 → C12 by condition”—as you instructed: “Keep the three pending relations as written.” Their pending proposal is cleared in [design.md](/Users/inertia/Desktop/www/tests/ads-introduction/design.md).

> Translation technology has advanced. However, existing translation services have cost and security issues. These issues make it necessary to develop small, domain-specific translation models that can run locally.
>
> Training such models requires parallel data. However, constructing parallel data manually is difficult. An alternative source of supervision is therefore needed. Teacher LLMs can supply this supervision by generating high-quality translations. However, applying them to the entire dataset is expensive. Yet even a small amount of high-quality parallel data can improve the student's translation performance. With a limited teacher annotation budget, which source sentences should therefore be selected for teacher translation?
>
> To address this question, we propose QE-guided Active Data Selection (ADS). In this method, the student's translations are evaluated with a QE model, and sentences with low QE scores are prioritized.

The self-check passed without changes; all twelve claims appear in order. The independent check found no mismatches. The Korean explanation below was checked against the record.

번역 기술은 발전했지만 기존 번역 서비스에는 비용과 보안 문제가 있습니다. 따라서 로컬에서 실행할 수 있는 작은 도메인 특화 번역 모델을 개발할 필요가 있다는 데서 출발합니다.

이러한 모델을 학습하려면 병렬 데이터가 필요하지만, 사람이 직접 만들기는 어렵습니다. 따라서 다른 학습 신호 공급원이 필요하며, Teacher LLM은 고품질 번역을 생성해 이를 제공할 수 있습니다. 그러나 전체 데이터에 Teacher LLM을 적용하면 비용이 큽니다. 한편 소량의 고품질 병렬 데이터만으로도 student의 번역 성능을 개선할 수 있으므로, 제한된 예산으로 어떤 원문 문장을 teacher에게 번역하도록 맡길 것인지가 연구 질문이 됩니다.

이 질문에 대응하는 방법으로 QE-guided Active Data Selection(ADS)을 제안합니다. ADS는 student의 번역을 QE 모델로 평가하고, QE 점수가 낮은 문장을 우선 선택합니다.