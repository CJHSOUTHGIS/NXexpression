--********************************************************************************
-- 将 sqcglx 中误存的序号（如 1,4,2）批量转为中文名称
-- 已是中文名称的记录不会变更
--********************************************************************************

CREATE OR REPLACE FUNCTION smap_sqcglx_to_labels(p_raw text) RETURNS text
LANGUAGE plpgsql
AS $$
DECLARE
    v_token text;
    v_index int;
    v_result text := '';
    v_labels text[] := ARRAY[
        '基本地形图', '航摄影像', '卫星影像', 'GPS控制点', '三角控制点', '水准控制点',
        '专题数据', '土地资料', '科技档案', '测绘项目档案', '其它资料'
    ];
BEGIN
    IF p_raw IS NULL OR trim(p_raw) = '' THEN
        RETURN '';
    END IF;
    IF p_raw !~ '^[\d,\s;，；]+$' THEN
        RETURN p_raw;
    END IF;

    FOREACH v_token IN ARRAY regexp_split_to_array(p_raw, '[,;，；]') LOOP
        v_token := trim(v_token);
        IF v_token = '' THEN
            CONTINUE;
        END IF;
        v_index := v_token::int;
        IF v_index BETWEEN 1 AND 11 THEN
            IF v_result <> '' THEN
                v_result := v_result || ',';
            END IF;
            v_result := v_result || v_labels[v_index];
        END IF;
    END LOOP;

    RETURN v_result;
END;
$$;

UPDATE proj_cgsqckdj
SET sqcglx = smap_sqcglx_to_labels(sqcglx)
WHERE sqcglx IS NOT NULL
  AND trim(sqcglx) <> ''
  AND sqcglx ~ '^[\d,\s;，；]+$';

-- DROP FUNCTION IF EXISTS smap_sqcglx_to_labels(text);
