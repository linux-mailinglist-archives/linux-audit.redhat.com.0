Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id F00B822F8A8
	for <lists+linux-audit@lfdr.de>; Mon, 27 Jul 2020 21:04:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-vOaF31qAO2mMkMhuPq_cSQ-1; Mon, 27 Jul 2020 15:04:44 -0400
X-MC-Unique: vOaF31qAO2mMkMhuPq_cSQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49881800471;
	Mon, 27 Jul 2020 19:04:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AC648FF9F;
	Mon, 27 Jul 2020 19:04:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C87931809557;
	Mon, 27 Jul 2020 19:04:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06RJ4QWO022046 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 27 Jul 2020 15:04:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A3E0AF101A; Mon, 27 Jul 2020 19:04:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F4DA30BA6
	for <linux-audit@redhat.com>; Mon, 27 Jul 2020 19:04:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51E1F86BF49
	for <linux-audit@redhat.com>; Mon, 27 Jul 2020 19:04:24 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-300-vM6jN8yFO3adT5DP24r-hw-1; Mon, 27 Jul 2020 15:04:21 -0400
X-MC-Unique: vM6jN8yFO3adT5DP24r-hw-1
Received: by mail-qt1-f193.google.com with SMTP id w9so13069353qts.6
	for <linux-audit@redhat.com>; Mon, 27 Jul 2020 12:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=EC8zOFncLg9/ysdu+4AVfhbwIPv/GZuMddAqKzwsK50=;
	b=Acginl9saJ6PkWKVCt0xwOxRmxvPssby/3QvfzPcCKsht2uf3TT7+a5pZzjh8drK4o
	LrNqDnIZ4LPyh9QUdI48XJOqpvO+U3eZi7pOEVAuoX1eqZGkM18zY9YX9VMVredTX6u6
	ReerK8715KOTHjYWDLrjMAmsR8vx4ib6vKgRD77k7t6K289rebN8PJJ37SmUi1jDjl8R
	QMcNHVnNZEKJepV0lmhtaCibKSmQPFQ02ciKRgDryqXUxa8u2RaBtJ7CMSSUN4Tp1FRH
	gvEJTSfmNARw0Jbu2bjbWqXe13yHbDr8gPJBVMvnFmjUbmq5BbnY/i3WPN4Pv3BmgFMq
	4EmQ==
X-Gm-Message-State: AOAM5326gUpSzfwJqmgS3jL1uYYCzVeNpPng/vM5F9RPohIWSR+VKK2f
	hMxmtiLuqQasMi8RrYWADlg=
X-Google-Smtp-Source: ABdhPJzzq1YnJnkKBN4VwnD0P3fR4BceTpVszjvHhG6SQcqO7kIwdi6a1Djd6weNjvvT1vFxx2ykNA==
X-Received: by 2002:ac8:47c8:: with SMTP id d8mr22141686qtr.32.1595876660456; 
	Mon, 27 Jul 2020 12:04:20 -0700 (PDT)
Received: from [192.168.1.190] (pool-96-244-118-111.bltmmd.fios.verizon.net.
	[96.244.118.111]) by smtp.gmail.com with ESMTPSA id
	e61sm15772530qtd.20.2020.07.27.12.04.19
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 27 Jul 2020 12:04:20 -0700 (PDT)
Subject: Re: [PATCH v19 20/23] Audit: Add new record for multiple process LSM
	attributes
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
References: <20200724203226.16374-1-casey@schaufler-ca.com>
	<20200724203226.16374-21-casey@schaufler-ca.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Message-ID: <15b96494-c4ca-bf2f-0158-d28183d51aef@gmail.com>
Date: Mon, 27 Jul 2020 15:04:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724203226.16374-21-casey@schaufler-ca.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, sds@tycho.nsa.gov, linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gNy8yNC8yMCA0OjMyIFBNLCBDYXNleSBTY2hhdWZsZXIgd3JvdGU6Cgo+IENyZWF0ZSBhIG5l
dyBhdWRpdCByZWNvcmQgdHlwZSB0byBjb250YWluIHRoZSBzdWJqZWN0IGluZm9ybWF0aW9uCj4g
d2hlbiB0aGVyZSBhcmUgbXVsdGlwbGUgc2VjdXJpdHkgbW9kdWxlcyB0aGF0IHJlcXVpcmUgc3Vj
aCBkYXRhLgo+IFRoaXMgcmVjb3JkIGlzIGxpbmtlZCB3aXRoIHRoZSBzYW1lIHRpbWVzdGFtcCBh
bmQgc2VyaWFsIG51bWJlci4KPiBUaGUgcmVjb3JkIGlzIHByb2R1Y2VkIG9ubHkgaW4gY2FzZXMg
d2hlcmUgdGhlcmUgaXMgbW9yZSB0aGFuIG9uZQo+IHNlY3VyaXR5IG1vZHVsZSB3aXRoIGEgcHJv
Y2VzcyAiY29udGV4dCIuCj4KPiBCZWZvcmUgdGhpcyBjaGFuZ2UgdGhlIG9ubHkgYXVkaXQgZXZl
bnRzIHRoYXQgcmVxdWlyZWQgbXVsdGlwbGUKPiByZWNvcmRzIHdlcmUgc3lzY2FsbCBldmVudHMu
IFNldmVyYWwgbm9uLXN5c2NhbGwgZXZlbnRzIGluY2x1ZGUKPiBzdWJqZWN0IGNvbnRleHRzLCBz
byB0aGUgdXNlIG9mIGF1ZGl0X2NvbnRleHQgZGF0YSBoYXMgYmVlbiBleHBhbmRlZAo+IGFzIG5l
Y2Vzc2FyeS4KPgo+IFNpZ25lZC1vZmYtYnk6IENhc2V5IFNjaGF1ZmxlciA8Y2FzZXlAc2NoYXVm
bGVyLWNhLmNvbT4KPiBDYzogbGludXgtYXVkaXRAcmVkaGF0LmNvbQo+IC0tLQo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL25ldC94ZnJtLmggYi9pbmNsdWRlL25ldC94ZnJtLmgKPiBpbmRleCBjN2Qy
MTNjOWY5ZDguLjkzMDQzMmMzOTEyZSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL25ldC94ZnJtLmgK
PiArKysgYi9pbmNsdWRlL25ldC94ZnJtLmgKPiBAQCAtNjcyLDExICs2NzIsMTMgQEAgc3RhdGlj
IGlubGluZSBzdHJ1Y3QgYXVkaXRfYnVmZmVyICp4ZnJtX2F1ZGl0X3N0YXJ0KGNvbnN0IGNoYXIg
Km9wKQo+ICAgCj4gICAJaWYgKGF1ZGl0X2VuYWJsZWQgPT0gQVVESVRfT0ZGKQo+ICAgCQlyZXR1
cm4gTlVMTDsKPiArCWF1ZGl0X3N0YW1wX2NvbnRleHQoYXVkaXRfY29udGV4dCgpKTsKPiAgIAlh
dWRpdF9idWYgPSBhdWRpdF9sb2dfc3RhcnQoYXVkaXRfY29udGV4dCgpLCBHRlBfQVRPTUlDLAo+
ICAgCQkJCSAgICBBVURJVF9NQUNfSVBTRUNfRVZFTlQpOwo+ICAgCWlmIChhdWRpdF9idWYgPT0g
TlVMTCkKPiAgIAkJcmV0dXJuIE5VTEw7Cj4gICAJYXVkaXRfbG9nX2Zvcm1hdChhdWRpdF9idWYs
ICJvcD0lcyIsIG9wKTsKPiArCWF1ZGl0X2xvZ19sc20oTlVMTCwgZmFsc2UpOwoKTm90aWNlIHRo
YXQgdGhlIGF1ZGl0X2xvZ19zdGFydCgpIGNhbGwgYWJvdmUgc3BlY2lmaWVkIEdGUF9BVE9NSUMu
IEJ1dCAKeW91ciBhdWRpdF9sb2dfbHNtKCkgdXNlcyBHRlBfS0VSTkVMLiBZb3UnbGwgZWl0aGVy
IG5lZWQgdG8gYWx3YXlzIHVzZSAKR0ZQX0FUT01JQyBpbiBhdWRpdF9sb2dfbHNtKCkgb3IgcGFz
cyBpbiB0aGUgZ2ZwIGZsYWdzIHRoZXJlLsKgIE1ha2Ugc3VyZSAKeW91IHRlc3Qgd2l0aCBDT05G
SUdfREVCVUdfQVRPTUlDX1NMRUVQPXkgYW5kIGNoZWNrIHlvdXIgZG1lc2cgb3V0cHV0LgoKCi0t
CkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8v
d3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdA==

