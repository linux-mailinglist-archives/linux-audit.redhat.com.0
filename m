Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id DE91B10F28A
	for <lists+linux-audit@lfdr.de>; Mon,  2 Dec 2019 23:00:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575324015;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7Yri5ymTJDEVcb8sUHqlDqvzWXUnk9rWyjubv7LYrAs=;
	b=b4rRBOL/qOeXJnFcsFurDJqsYoJeHz+Tkftu14QCILAgXhpjhVy0ITHIZcLb7IugPLbvzj
	t/tm2vGlPw1JKdHjmKNMbOhRK7wPrDF13FDYmh3DPxojCe/vjuEmD91SU+z+qaIx1AVhWD
	qXMKcEz8ME2aHjD/dAyDSy48nvvr2Ok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-Vrh3DQLSP8u8bNpWAnyBRg-1; Mon, 02 Dec 2019 17:00:13 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BCF6107ACC5;
	Mon,  2 Dec 2019 22:00:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEF901001901;
	Mon,  2 Dec 2019 22:00:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F3EE94EDAD;
	Mon,  2 Dec 2019 22:00:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB2M018o019766 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 2 Dec 2019 17:00:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 07EE6E38F6; Mon,  2 Dec 2019 22:00:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03903E38ED
	for <linux-audit@redhat.com>; Mon,  2 Dec 2019 21:59:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAD1F906E11
	for <linux-audit@redhat.com>; Mon,  2 Dec 2019 21:59:58 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
	[209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-342-HTVkIcBiPp20Lw4ZcNTCxg-1; Mon, 02 Dec 2019 16:59:57 -0500
Received: by mail-ed1-f71.google.com with SMTP id v11so545612edw.11
	for <linux-audit@redhat.com>; Mon, 02 Dec 2019 13:59:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=XNzoyiL7v1T+qpMovqrqFLTc1ti1pLv3JwgE9CmOMvo=;
	b=SQaH6y+lt82usngqTv2/gmDYt5NyJk36NlH2Ei1bQGy4OK2qCfslsUULcGdQvw1eib
	KfBLXZN5UCYMgmBXYPA1BwkOxvhgjWhP02f6S3xuhDwHDcFfbHkkPRAhRNIDNXZ60EEn
	2mBUeXOzmrGpN92ZXILUdh0R6+dWOGccjnBNyPMBcknrjnGSsFbAkNK29jWfDuMEzLJi
	MVhMfTouKo20XYJalF83e1oC9G7YUaJG0s5yP4n9g/2H4m2p3Y2voB4t5+e3uu0nJgn9
	l26KAof/i1vHOCRB6E34QumfIUM5wzMHfWRrbeqKiw2M5nDfQ6vVmUXyQss3GaH+g7NH
	Mr+A==
X-Gm-Message-State: APjAAAXqas6c4ojFptG8QJUjB68C9x2OInFT1hgZ1UvooaCOrwzwYBYv
	IZs36cx74GN/O0H9rNbWG24JCgzbNKg1DnkjsqJk1fGan0CO2ezlpEiA32Cpk5dSBcqzuR3pIOM
	Sl4hlp8giOVGKMJV8SPfrtoSvwkCaDVZ1kWk=
X-Received: by 2002:a17:906:27d3:: with SMTP id
	k19mr1833156ejc.290.1575323996360; 
	Mon, 02 Dec 2019 13:59:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqwvKbidXzdtsc1DIPAiRnwsunrZTpGrWpN/xJrOxMPyvS5xh1oX2Qwm82IvV3XZkrDBYsUvgUl1c6OjmvyYe/U=
X-Received: by 2002:a17:906:27d3:: with SMTP id
	k19mr1833129ejc.290.1575323996154; 
	Mon, 02 Dec 2019 13:59:56 -0800 (PST)
MIME-Version: 1.0
References: <69A96564-7961-4A2E-AABD-F1C254A0BEB1@me.com>
In-Reply-To: <69A96564-7961-4A2E-AABD-F1C254A0BEB1@me.com>
From: Ondrej Moris <omoris@redhat.com>
Date: Mon, 2 Dec 2019 22:59:45 +0100
Message-ID: <CAGf2o_fyGovSEOGcqOm8XfuWuyz82fpRg-fSCE=+t2SFaGRz8A@mail.gmail.com>
Subject: Re: Typo in /audit-userspace/src/ausearch-options.c on line 228.
	'starting data' instead of 'starting date'
To: Harold-Owen Wilke <harywilke@me.com>
X-MC-Unique: HTVkIcBiPp20Lw4ZcNTCxg-1
X-MC-Unique: Vrh3DQLSP8u8bNpWAnyBRg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB2M018o019766
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSGFyeSwgdGhpcyBpcyBhY3R1YWxseSBub3QgYSBiYWQgd2F5IHRvIHJlcG9ydCBpc3N1ZXMg
YW5kIHRoYW5rcwpmb3IgdGhlIGNhdGNoIQotLQpPbmRyZWoKCk9uIE1vbiwgRGVjIDIsIDIwMTkg
YXQgMTA6NTcgUE0gSGFyb2xkLU93ZW4gV2lsa2UgPGhhcnl3aWxrZUBtZS5jb20+IHdyb3RlOgo+
Cj4gQXMgdGhlIHN1YmplY3Qgc2F5cy4KPiBBcG9sb2dpZXMgZm9yIHRoZSBpbmNvcnJlY3Qgd2F5
IG9mIHJlcG9ydGluZyB0aGlzIGJ1ZywgdGhlIEdpdEh1YiBwYWdlIHNhaWQgaXTigJlzIG5vdCBy
ZWFsbHkgbW9uaXRvcmVkLCBJIGdvdCBmcnVzdHJhdGVkIHdpdGggdGhlIGJ1Z3ppbGxhIHBvcnRh
bCwgZGlkbuKAmXQgd2FudCB0byBtaXNmaWxlIGl0IGFuZCBpdOKAmXMgcmVhbGx5IG1pbm9yLgo+
Cj4gaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LWF1ZGl0L2F1ZGl0LXVzZXJzcGFjZS9ibG9iL21h
c3Rlci9zcmMvYXVzZWFyY2gtb3B0aW9ucy5jCj4KPgo+IC1oYXJ5Cj4gLS0KPiBMaW51eC1hdWRp
dCBtYWlsaW5nIGxpc3QKPiBMaW51eC1hdWRpdEByZWRoYXQuY29tCj4gaHR0cHM6Ly93d3cucmVk
aGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0CgoKLS0KTGludXgtYXVkaXQgbWFp
bGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0

