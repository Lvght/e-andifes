CREATE OR REPLACE FUNCTION is_valid_url(url_text VARCHAR) RETURNS BOOLEAN AS $$
DECLARE
    valid_schemes CONSTANT VARCHAR[] := ARRAY['http', 'https', 'ftp', 'ftps'];
    url_parts VARCHAR[];
    scheme_found BOOLEAN := FALSE;
    valid_scheme VARCHAR;
BEGIN
    url_parts := string_to_array(url_text, '//');

    IF array_length(url_parts, 1) < 2 THEN
        RETURN FALSE;
    END IF;

    FOR valid_scheme IN SELECT unnest(valid_schemes) LOOP
        IF url_parts[1] ILIKE valid_scheme || ':%' THEN
            scheme_found := TRUE;
            EXIT;  
        END IF;
    END LOOP;

    RETURN scheme_found;
END;
$$ LANGUAGE plpgsql;
