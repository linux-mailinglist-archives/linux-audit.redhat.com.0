Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 520766F7969
	for <lists+linux-audit@lfdr.de>; Fri,  5 May 2023 00:54:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683240845;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kfNdUOCwU61NbepdBGhoVfknKb6QYmPbDr6G4Yof2Kg=;
	b=ZMGzTKykWPpP+05vp9uLNKXd7b8//aemMQu838K7saFc96dL6wGNvKYMdF3NjMnIMunrCU
	RdiVBOXlgykF32MMtO15fEmzWyTKPaCP1KvQ+pfWvGpgA6/IKo7piha381+Dq2GrZUEBO0
	ECMznCvEObFjqCBc/A0wHTmRpB9odSg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-ncsKpMm6Of2fGi3_SDqWVA-1; Thu, 04 May 2023 18:54:03 -0400
X-MC-Unique: ncsKpMm6Of2fGi3_SDqWVA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93319A0F388;
	Thu,  4 May 2023 22:54:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E59510DF8;
	Thu,  4 May 2023 22:53:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 72D691946A4A;
	Thu,  4 May 2023 22:53:54 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CC7A919465BB for <linux-audit@listman.corp.redhat.com>;
 Thu,  4 May 2023 22:53:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A6B8B40BC79A; Thu,  4 May 2023 22:53:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F60340BC799
 for <linux-audit@redhat.com>; Thu,  4 May 2023 22:53:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84398101A531
 for <linux-audit@redhat.com>; Thu,  4 May 2023 22:53:52 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-xh4Ecnw_MZK0PbkzIv1p0g-1; Thu, 04 May 2023 18:53:49 -0400
X-MC-Unique: xh4Ecnw_MZK0PbkzIv1p0g-1
Received: from fsav315.sakura.ne.jp (fsav315.sakura.ne.jp [153.120.85.146])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 344MrhGv079515;
 Fri, 5 May 2023 07:53:43 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav315.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav315.sakura.ne.jp);
 Fri, 05 May 2023 07:53:43 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav315.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 344Mrh38079512
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 5 May 2023 07:53:43 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <415a4871-4d84-a31f-5417-e850a98bbffd@I-love.SAKURA.ne.jp>
Date: Fri, 5 May 2023 07:53:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: Can AUDIT_LIST_RULES causes kthreadd-spam?
To: Paul Moore <paul@paul-moore.com>
References: <ecd4bf68-3bf1-a1d8-4da5-5fbd28c51a6b@gmail.com>
 <CAHC9VhTXHLS7bsDJ8-dSp4dQSQRcKRLiTMRYJOJVCY11G5D85A@mail.gmail.com>
 <e5713a91-37b0-d32f-a0d2-eb668122c9e4@gmail.com>
 <9ae2c1df-1f20-a40b-35ed-1dc76b122a4f@I-love.SAKURA.ne.jp>
 <CAHC9VhTfxqrWaJrBccDY9LJR+Fggr__zufD-Wd=0VZwN5bBU6g@mail.gmail.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <CAHC9VhTfxqrWaJrBccDY9LJR+Fggr__zufD-Wd=0VZwN5bBU6g@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by www262.sakura.ne.jp id
 344MrhGv079515
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: Rinat Gadelshin <rgadelsh@gmail.com>, linux-audit@redhat.com,
 audit@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: i-love.sakura.ne.jp
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMjAyMy8wNS8wNSAzOjQwLCBQYXVsIE1vb3JlIHdyb3RlOgo+IE9uIFdlZCwgTWF5IDMsIDIw
MjMgYXQgMTA6NTDigK9QTSBUZXRzdW8gSGFuZGEKPiA8cGVuZ3Vpbi1rZXJuZWxAaS1sb3ZlLnNh
a3VyYS5uZS5qcD4gd3JvdGU6Cj4+IE9uIDIwMjMvMDUvMDQgNzoxMiwgUmluYXQgR2FkZWxzaGlu
IHdyb3RlOgo+Pj4gT24gMDQuMDUuMjAyMyAwMDoyNywgUGF1bCBNb29yZSB3cm90ZToKPj4+PiBD
YW4geW91IGJlIG1vcmUgc3BlY2lmaWMgYWJvdXQgdGhlIGtlcm5lbCB0aHJlYWRzIHlvdSBhcmUg
c2VlaW5nLCBhcmUKPj4+PiB5b3Ugc2VlaW5nIG11bHRpcGxlICJrYXVkaXRkIiB0aHJlYWRzPwo+
Pj4+Cj4+Pj4gJSBwcyAtZkMga2F1ZGl0ZAo+Pj4+IFVJRCAgICAgICAgICBQSUQgICAgUFBJRCAg
QyBTVElNRSBUVFkgICAgICAgICAgVElNRSBDTUQKPj4+PiByb290ICAgICAgICAgIDg5ICAgICAg
IDIgIDAgQXByMjggPyAgICAgICAgMDA6MDA6MDAgW2thdWRpdGRdCj4+Cj4+IEkgZG9uJ3QgdGhp
bmsgc28uCj4+Cj4+IGtlcm5lbCBhdWRpdCBzdWJzeXN0ZW0gdXNlcyBrdGhyZWFkX3J1bigpIGlu
IG9yZGVyIHRvIHJ1biBzaG9ydC1saXZlZCBrZXJuZWwgdGhyZWFkcy4KPiAKPiBUaGFua3MgVGV0
c3VvLCBJIGFncmVlIHRoYXQncyBmYXIgbW9yZSBsaWtlbHkuICBFdmVyIHNpbmNlIEkgdG9vayBv
dmVyCj4gc2hlcGhlcmRpbmcgdGhlIGF1ZGl0IGNvZGUsIGFsbCBvZiB0aGUgdGhyZWFkIGlzc3Vl
cyBoYXZlIGJlZW4gYXJvdW5kCj4gdGhlIG1haW4gYXVkaXQgcXVldWUgdGhyZWFkIHNvIGl0J3Mg
YSBiaXQgcmVmbGV4aXZlIHRvIGFzc3VtZSB0aGF0IGlzCj4gdGhlIGNhc2UgOikKPiAKClNpbmNl
IGt0aHJlYWRfcnVuKGF1ZGl0X3NlbmRfbGlzdF90aHJlYWQpIGlzIGNhbGxlZCBieSBhdWRpdF9y
ZWNlaXZlX21zZyhBVURJVF9MSVNUX1JVTEVTKQp2aWEgYXVkaXRfbGlzdF9ydWxlc19zZW5kKCks
IHRyeWluZyB0byBhdWRpdCBmb3JrIHJlcXVlc3QgdmlhIEFVRElUX0xJU1RfUlVMRVMgd2lsbCBj
YXVzZQpzcGFtcy4gTWF5YmUgc29tZXRoaW5nIGlzIGdvaW5nIHdyb25nIHdpdGggIkFuZCBzdWNo
IGV2ZW50cyBvY2N1cnJlZCAxMjA4IHRpbWVzIHdoZW4KQVVESVRfTElTVF9SVUxFUyBpcyBzZW5k
aW5nLiIgcGFydDsgbGV0J3Mgd2FpdCBmb3Igd2hhdCBwcmludGsoKSBzYXlzLgoKQnkgdGhlIHdh
eSwgd2h5IGRvIHdlIG5lZWQgdG8gdXNlIGt0aHJlYWRfcnVuKCkgZm9yIHNob3J0LWxpdmVkIHRh
c2tzPyBDYW4ndCB3ZSB1c2UKYSBkZWRpY2F0ZWQgd29ya3F1ZXVlIHdoaWNoIHdvdWxkIHNpZ25p
ZmljYW50bHkgcmVkdWNlIGZyZXF1ZW5jeSBvZiBmb3JrIHJlcXVlc3QgZm9yCkFVRElUX0xJU1Rf
UlVMRVMgcmVxdWVzdD8KCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEBy
ZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYXVkaXQK

