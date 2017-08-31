package cc.onezen.pay.http;

import java.util.Iterator;
import java.util.Map.Entry;

public interface IRequestParamsFormat {
	public String formatToStr(Iterator<Entry<String, Object>> it);
}
