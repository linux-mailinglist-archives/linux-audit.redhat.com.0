Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 13E911E861B
	for <lists+linux-audit@lfdr.de>; Fri, 29 May 2020 19:59:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590775188;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post:autocrypt:autocrypt;
	bh=Hg3bIBHqDv3zghKVMRWxSlC4bFU3RPh0/JA/kzjaepg=;
	b=Z2o66EiryxyRDALZ10atl20AGH3Ag2Ke9ikJ68f2CD6dQoNphkbNTOxXAaJ95+cCG0H6XY
	vFC9/Xu6GXcG6mO26PriEYiE/sgpZR9E3t18Fo8NjfvP4sf4D3yjhYUHDBM17y06NJLYCE
	ySQz/TaQIwqKFwv6TIegSb7eQnuozc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-bSbvSyxUOvi2__Hu9XIS0Q-1; Fri, 29 May 2020 13:59:46 -0400
X-MC-Unique: bSbvSyxUOvi2__Hu9XIS0Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEB49461;
	Fri, 29 May 2020 17:59:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 215FE7A8C7;
	Fri, 29 May 2020 17:59:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD0F91809543;
	Fri, 29 May 2020 17:59:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04THxIpG007468 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 13:59:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8FC1310BC2BF; Fri, 29 May 2020 17:59:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89EE310BC2B3
	for <linux-audit@redhat.com>; Fri, 29 May 2020 17:59:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B18BC101A525
	for <linux-audit@redhat.com>; Fri, 29 May 2020 17:59:15 +0000 (UTC)
Received: from sonic307-15.consmr.mail.ne1.yahoo.com
	(sonic307-15.consmr.mail.ne1.yahoo.com [66.163.190.38]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-337-1Q7VzeqYMtyED_s7Pj_mEQ-1;
	Fri, 29 May 2020 13:59:13 -0400
X-MC-Unique: 1Q7VzeqYMtyED_s7Pj_mEQ-1
X-YMail-OSG: Nu.DFukVM1nM0cKHh2qGASWe9r0xfFmtoK7vGkg7kyTLHfcZyZM_hZWXfX6ky38
	g.IRP_o1KvA0FP9Cwn7Hka.xm.hOLNQ6A5mrduX5xgLKmV32ZwyXAnHTiByvan4eOcdR7SUtC5Yv
	kPF9bCBRGAjJy2AspmGU2ZWtGGyzEBgg8Yfew8dapjiQ6DwCNJOaxx5Zi0mm3PNoeP.dnfkh3ABw
	mw3.OQ3VbijBDANTaCPCZEjm3Ne6HwRAn1NHtGOTi8hojUpCYGrPPftdhylnWa95O9j6T7pbJY2m
	VrrIERPnxkESj6txdB1YS97vT8gJyQP5DR48_LEafGIvSGZfHEMeW8D.pprp4GoG8.HpeC5gCAId
	fmRujm62miRK8TpS7AO9Mq8fWTctdvJTVTdjNBpulLtu5_ldVqVwvXjDuIYF21ZsiO_PtQXQfd3v
	1Ja_z2oC8MOpJi6xna3ctZdSY0ggSchT.s.9ONkv_697ObMduL1Vv4utXq_a733OCMKHPF6Rplcw
	WGhCC_C1uXlzK3ttv5qA4qUf.Vwr6D7XVRS48OdKlW79hp96BauUJFndxE9mUyUcCDVrLiy0507q
	CSfNAVLGPC84G3N7TSahBe3TTE0x0PCBvwv96xhfg3zB8qT7UBH.AYhhNBFjT9VjA2gB4uT0g2Wd
	KX9Z5uE473StqFI74D1nkliuQLh5dDJfFhK2AR8TwAWJ3UEsI5uTpF1rJGJXvGVBa1nZT7UlNxYY
	FmSzuMUlvxLI._QLX1fximsXQcySY9huDJse7JhbWtGi4lkvs9W3p4N1pR3JZbbYS9aOiqIm2GYN
	Qau5h2.DOfscGzrLXUrdYPr948ds5yGfsiAE3ap_IOG8PZEaF2Ge_loBFgQ9mfM4YYylcqJw2Dkw
	SAkThU2u1SWsG0y6V5OPzdWA.EZxOB5ffxRIeRjxtSy1kgWuiJ1WKI9U1OaMFNv0TYiTmYuQ_7AZ
	ArEDC.c6Aq8pZHA9dmc6ZHhJrRrvTQmhiJla0VuTYbJTEJNHpWCUasYA7pxTFB3Kga3HD6F4bTeh
	FONS7hJvPfUjeULTJjPAIAO5eU4hCiMQfPk3X6Ebx0cAtRTAlQbTo.tifGqmtSsoIVYnsu3o3tRm
	RiZMtud1kSGjMztJWhWDQvsvFIYVzz2SKcf4BYm_VAYEAczv1ndRNQvAIdrBFggmVgwZG..xJjqH
	t2I7ZRnxHODRgsX9rq_56bEotT5LKKjuzEomMsnO2L3tVRJOcvzTlRDSXCK2eTIx4Srb8s__qmXa
	ZA4vSamAt25ypXuO.djbpcx5qXWoOdEmb405sFjlUrfLra_nv4Zt_bSLY2_ZItZj198eEgJpxTw.
	mx0Aj09T.GzhMkVUDihgiUwlLzQepXptO9.sT6OSmpQSfgK1YfomLutD5UL8QH_Ve_YZHtr_7oaM
	tS04.OORzDcmGa4cwOMK019I-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic307.consmr.mail.ne1.yahoo.com with HTTP;
	Fri, 29 May 2020 17:59:12 +0000
Received: by smtp408.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 51180fe50fc4cd6edc6ba017913e7f2c; 
	Fri, 29 May 2020 17:59:09 +0000 (UTC)
To: Linux-Audit Mailing List <linux-audit@redhat.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Subject: The audit "context" and when to expect it.
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <45ce3357-ca82-8721-22d6-dabe751ad8fa@schaufler-ca.com>
Date: Fri, 29 May 2020 10:59:09 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
Content-Language: en-US
References: <45ce3357-ca82-8721-22d6-dabe751ad8fa.ref@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04THxIpG007468
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


What does a NULL audit context (e.g. ab->cxt == NULL) tell
me about the status of the audit buffer? It seems like it should
be telling me that the audit buffer is being created for some
purpose unrelated to the current task. And yet there are places
where information is pulled from the current task even when
the cxt is NULL.



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

