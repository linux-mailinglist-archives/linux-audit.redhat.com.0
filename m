Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB866B5239
	for <lists+linux-audit@lfdr.de>; Fri, 10 Mar 2023 21:55:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678481707;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wmy5pmCCgVOWWoeukodQXejlniW3sxmHSrFZ1psTphE=;
	b=L/3BVoi/i8sepVP/W6NHvx/In3sMYQc8p3jKSjyZlhNMrL1cGcOxn1bodd068jOCCoibpX
	YwQC+/FqBiqdHlJBn5rS4KENrsOBdY/cOKJbuAvu6RuNsOzlKmMGxEkSydD+CsHINkG5DT
	X1x+/VCGr9jG9M+X32hzywmN5gx3J7w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-inWdXhKePDmVAvPfTi1eaQ-1; Fri, 10 Mar 2023 15:55:02 -0500
X-MC-Unique: inWdXhKePDmVAvPfTi1eaQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E323F811E9C;
	Fri, 10 Mar 2023 20:54:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C4B62026D4B;
	Fri, 10 Mar 2023 20:54:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E638F1946A6F;
	Fri, 10 Mar 2023 20:54:57 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3A4991946587 for <linux-audit@listman.corp.redhat.com>;
 Fri, 10 Mar 2023 20:54:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1BC3440C945A; Fri, 10 Mar 2023 20:54:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13DEA4014EB9
 for <linux-audit@redhat.com>; Fri, 10 Mar 2023 20:54:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB30D857A87
 for <linux-audit@redhat.com>; Fri, 10 Mar 2023 20:54:55 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-215-uxWDTIcbM1KvWQFJB_kAAA-1; Fri,
 10 Mar 2023 15:54:54 -0500
X-MC-Unique: uxWDTIcbM1KvWQFJB_kAAA-1
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8DDFF3F1B1
 for <linux-audit@redhat.com>; Fri, 10 Mar 2023 20:54:50 +0000 (UTC)
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-1768b61f430so3366516fac.14
 for <linux-audit@redhat.com>; Fri, 10 Mar 2023 12:54:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678481688;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vjuVEV0EwRWXsFdBhAXy2mXNhxd8vBJQReCurjPO03w=;
 b=S3SrFQ1xs/0TaHYtE79/9UdduLJ/dzyX+q639rhcmsz1iPlvMmZTvnGAtDYnuedllY
 ds1xHv4gUjYjo49RKD1jzwx3lO1YFe3CWNyWClhn+OrI5fXjxnvd8b7+c/78ch5iqktV
 tT0LMoOalf2+4/IGeYx6Q92k8TYtn1MGc3fFkX04+GUObKy9Ss/RQnumi569/MP79j74
 kKVZvOeROwcPgYVLlE0yXp3C2kCX3eshyi4kIMEyViM8DXhe8q5rzoHU8GbO+FrD5gMN
 M0Rec4h6dbduIXZc/so0LkO1Z2rmsYtl23CziR3FKScgYebG4mwRsi6kWeqmHz9/HxhX
 nhJQ==
X-Gm-Message-State: AO0yUKUhlXnIvxJlZux9vJEaAqFuFjuojXQvh23CW2/iCEpf0tFp+otf
 nbfnHfL+KsYdn6gyupLQKMRVopNaqpHMH9GXPhA5NiDh2T28xwC3knXVW7UYeI/C1fuJj7IA6/V
 PuHuO5PuMULRfr6YpRMdBAjgj/ijUWok84gDvZ6Ik806Ve7nM+38hBXFRDg==
X-Received: by 2002:aca:1201:0:b0:384:2615:f63 with SMTP id
 1-20020aca1201000000b0038426150f63mr9019135ois.3.1678481686936; 
 Fri, 10 Mar 2023 12:54:46 -0800 (PST)
X-Google-Smtp-Source: AK7set89tetfQEvuJy1/GUdfW69lPn+/Alpwvmmqz5GaaKi1427guBZCnxT0Usl6yjiRPXG6JUxXEeQnrV3GWEbhV/Q=
X-Received: by 2002:aca:1201:0:b0:384:2615:f63 with SMTP id
 1-20020aca1201000000b0038426150f63mr9019110ois.3.1678481685250; Fri, 10 Mar
 2023 12:54:45 -0800 (PST)
MIME-Version: 1.0
References: <CAH6unQK=a54uxPjvdgNrZy57cHwZKw72rJMNeDRxAch8q46dcQ@mail.gmail.com>
 <ZApM8u7iq7mDsdLW@madcap2.tricolour.ca>
 <CAH6unQJgo93VMKHUF7_LtjWu=L8yMEXfhGx6xHSDkATwG-SL=A@mail.gmail.com>
 <4470524.LvFx2qVVIh@x2>
 <CAHC9VhSeZpD3d0kOoNY0_y=RbwA1X1TCF97f8xA8XH9hyzsmvw@mail.gmail.com>
 <ZAuVJGYnCljvFNcL@madcap2.tricolour.ca>
In-Reply-To: <ZAuVJGYnCljvFNcL@madcap2.tricolour.ca>
From: Bruce Elrick <bruce.elrick@canonical.com>
Date: Fri, 10 Mar 2023 13:54:33 -0700
Message-ID: <CAH6unQJLa9nLstu2TZeJBCdrXF6wqnKKSD5dD2-CTOs+w2n48w@mail.gmail.com>
Subject: Re: Auditing nftables changes
To: Richard Guy Briggs <rgb@redhat.com>
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
Cc: linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlc2UgY2xhcmlmaWNhdGlvbnMgaGFkIHJlYWxseSBoZWxwZWQuIEkgd2lsbCBkZWZpbml0ZWx5
IGNoZWNrIG91dAp5b3VyIHByZXNlbnRhdGlvbnMsIFJpY2hhcmQuCgpUaGFuayB5b3UgYWdhaW4g
dG8gYm90aCBvZiB5b3UgZm9yIHlvdXIgcGF0aWVudCBleHBsYW5hdGlvbnMuIFRoZXkgYXJlCm11
Y2ggYXBwcmVjaWF0ZWQuCgpIYXZlICBhIGdvb2Qgd2Vla2VuZCEKQnJ1Y2UKCk9uIEZyaSwgTWFy
IDEwLCAyMDIzIGF0IDE6MzjigK9QTSBSaWNoYXJkIEd1eSBCcmlnZ3MgPHJnYkByZWRoYXQuY29t
PiB3cm90ZToKPgo+IE9uIDIwMjMtMDMtMTAgMTE6MDQsIFBhdWwgTW9vcmUgd3JvdGU6Cj4gPiBP
biBGcmksIE1hciAxMCwgMjAyMyBhdCA5OjM24oCvQU0gU3RldmUgR3J1YmIgPHNncnViYkByZWRo
YXQuY29tPiB3cm90ZToKPiA+ID4gT24gVGh1cnNkYXksIE1hcmNoIDksIDIwMjMgNTo1MjoyOCBQ
TSBFU1QgQnJ1Y2UgRWxyaWNrIHdyb3RlOgo+ID4gPiA+IEFueXdheSwgSSB0aGluayBJIG5lZWQg
dG8gc3BlbmQgc29tZSB0aW1lIHBsYXlpbmcgdW50aWwgdGhhdCAiYWhhISIKPiA+ID4gPiBtb21l
bnQgY29tZXMuIEl0J3MgZmVlbHMgYSBsb3QgY2xvc2VyIHRoYW5rcyB0byBib3RoIG9mIHlvdXIg
cmVzcG9uc2VzCj4gPiA+ID4gYW5kIEkgcmVhbGx5IGFwcHJlY2FpdGUgdGhlIHRpbWUgeW91J3Zl
IHRha2VuIHRvIHJlYWQgbXkgZW1haWxzIGFuZAo+ID4gPiA+IHJlc3BvbmQgdG8gdGhlbS4KPiA+
ID4KPiA+ID4gVGhlcmUgYXJlIHNpbXBsZSBldmVudHMgd2hpY2ggYXJlIG9uZSBsaW5lIGFuZCBj
b21wb3VuZCBldmVudHMgd2hpY2ggYXJlCj4gPiA+IG11bHRpcGxlIGxpbmVzIC0gY2FsbGVkIHJl
Y29yZHMuIFRoZSBzaW1wbGUgZXZlbnRzIHRlbmQgdG8gYmUgaGFyZHdpcmVkIGFuZAo+ID4gPiBu
b3Qgb3B0aW9uYWwuIEZvciBleGFtcGxlLCBsb2dpbnMgYXJlIGhhcmR3aXJlZDsga2VybmVsIGNv
bmZpZyBjaGFuZ2VzIGFyZQo+ID4gPiBoYXJkd2lyZWQ7IGF1dGhlbnRpY2F0aW9uIGlzIGhhcmR3
aXJlZC4KPiA+Cj4gPiBSZWFkaW5nIFN0ZXZlJ3MgcmVzcG9uc2UgSSdtIG5vdCBzdXJlIHdlIHVz
ZSB0aGUgc2FtZSB0ZXJtaW5vbG9neSwgb3IKPiA+IHBlcmhhcHMgd2UgZXhwbGFpbiBpdCBhIGJp
dCBkaWZmZXJlbnRseS4gIFJlZ2FyZGxlc3MsIGhlcmUgaXMgYSBxdWljawo+ID4gZGVmaW5pdGlv
biB0aGF0IEkgc3RpY2sgdG8gd2hlbiBkaXNjdXNzaW5nIGF1ZGl0Ogo+ID4KPiA+ICJhdWRpdCBy
ZWNvcmQiOiBBbiBhdWRpdCByZWNvcmQgaXMgYSBzaW5nbGUgbGluZSBpbiB0aGUgYXVkaXQgbG9n
IHRoYXQKPiA+IGNvbnNpc3RzIG9mIGEgdGltZXN0YW1wLCByZWNvcmQgdHlwZSAodHlwZT1YWFgp
LCBhbmQgYSBzZXJpZXMgb2YKPiA+IGZpZWxkcyB3aGljaCBhcmUgZGVwZW5kZW50IG9uIHRoZSBy
ZWNvcmQgdHlwZS4gIEhlcmUgaXMgYW4gZXhhbXBsZSBvZgo+ID4gYSBTWVNDQUxMIHJlY29yZDoK
PiA+Cj4gPiAgdHlwZT1TWVNDQUxMIG1zZz1hdWRpdCgwMy8xMC8yMDIzIDEwOjU5OjAwLjc5Nzo1
NjMpIDoKPiA+ICAgYXJjaD14ODZfNjQgc3lzY2FsbD1icGYgc3VjY2Vzcz15ZXMgZXhpdD0xMiBh
MD1CUEZfUFJPR19MT0FECj4gPiAgIGExPTB4N2ZmZGUwZWZjNjUwIGEyPTB4ODAgYTM9MHgxMyBp
dGVtcz0wIHBwaWQ9MSBwaWQ9MjY4Mwo+ID4gICBhdWlkPXJvb3QgdWlkPXJvb3QgZ2lkPXJvb3Qg
ZXVpZD1yb290IHN1aWQ9cm9vdCBmc3VpZD1yb290Cj4gPiAgIGVnaWQ9cm9vdCBzZ2lkPXJvb3Qg
ZnNnaWQ9cm9vdCB0dHk9KG5vbmUpIHNlcz0xMCBjb21tPXN5c3RlbWQKPiA+ICAgZXhlPS91c3Iv
bGliL3N5c3RlbWQvc3lzdGVtZAo+ID4gICBzdWJqPXVuY29uZmluZWRfdTp1bmNvbmZpbmVkX3I6
dW5jb25maW5lZF90OnMwLXMwOmMwLmMxMDIzIGtleT0obnVsbCkKPiA+Cj4gPiAiYXVkaXQgZXZl
bnQiOiBBbiBhdWRpdCBldmVudCBjb25zaXN0cyBvZiBtdWx0aXBsZSBhdWRpdCByZWNvcmRzCj4g
PiBncm91cGVkIHRvZ2V0aGVyIGJ5IGEgc2luZ2xlIHRpbWVzdGFtcC4gIFNpbmdsZSByZWNvcmQg
YXVkaXQgZXZlbnRzCj4gPiBhcmUgYWxsb3dlZCBhbmQgZG8gZXhpc3QuICBUaGVyZSBpcyBubyB1
cHBlciBib3VuZCBvbiB0aGUgbnVtYmVyIG9mCj4gPiByZWNvcmRzIGFsbG93ZWQgaW4gYW4gYXVk
aXQgZXZlbnQuICBIZXJlIGlzIGFuIGV4YW1wbGUgb2YgYW4gYXVkaXQKPiA+IGV2ZW50IGNvbnNp
c3Rpbmcgb2YgUFJPQ1RJVExFLCBTWVNDQUxMLCBhbmQgQlBGIGF1ZGl0IHJlY29yZHM6Cj4gPgo+
ID4gIHR5cGU9UFJPQ1RJVExFIG1zZz1hdWRpdCgwMy8xMC8yMDIzIDEwOjU5OjAwLjc5Nzo1NjMp
IDoKPiA+ICAgcHJvY3RpdGxlPShzeXN0ZW1kKQo+ID4gIHR5cGU9U1lTQ0FMTCBtc2c9YXVkaXQo
MDMvMTAvMjAyMyAxMDo1OTowMC43OTc6NTYzKSA6Cj4gPiAgIGFyY2g9eDg2XzY0IHN5c2NhbGw9
YnBmIHN1Y2Nlc3M9eWVzIGV4aXQ9MTIgYTA9QlBGX1BST0dfTE9BRAo+ID4gICBhMT0weDdmZmRl
MGVmYzY1MCBhMj0weDgwIGEzPTB4MTMgaXRlbXM9MCBwcGlkPTEgcGlkPTI2ODMKPiA+ICAgYXVp
ZD1yb290IHVpZD1yb290IGdpZD1yb290IGV1aWQ9cm9vdCBzdWlkPXJvb3QgZnN1aWQ9cm9vdAo+
ID4gICBlZ2lkPXJvb3Qgc2dpZD1yb290IGZzZ2lkPXJvb3QgdHR5PShub25lKSBzZXM9MTAgY29t
bT1zeXN0ZW1kCj4gPiAgIGV4ZT0vdXNyL2xpYi9zeXN0ZW1kL3N5c3RlbWQKPiA+ICAgc3Viaj11
bmNvbmZpbmVkX3U6dW5jb25maW5lZF9yOnVuY29uZmluZWRfdDpzMC1zMDpjMC5jMTAyMyBrZXk9
KG51bGwpCj4gPiAgdHlwZT1CUEYgbXNnPWF1ZGl0KDAzLzEwLzIwMjMgMTA6NTk6MDAuNzk3OjU2
MykgOgo+ID4gICBwcm9nLWlkPTE3MiBvcD1MT0FECj4KPiBBbiAiYXVkaXQgZXZlbnQiIHdoaWNo
IGlzIGEgY29sbGVjdGlvbiBvZiBhdWRpdCByZWNvcmRzIHdpdGggdGhlIHNhbWUKPiB0aW1lc3Rh
bXAgYW5kIHNlcmlhbCBudW1iZXIgY29ycmVzcG9uZCB0byAqb25lKiBldmVudCBvZiBpbnRlcmVz
dCB0byB0aGUKPiBhdWRpdCBzdWJzeXN0ZW0gZWl0aGVyIGR1ZSB0byBpbnRlcm5hbCBydWxlcyBv
ciBhZGRlZCBhdWRpdCBydWxlcyB0aGF0Cj4gd2hlbiB0cmlnZ2VyZWQgcmVjb3JkIGF1ZGl0IGlu
Zm9ybWF0aW9uIGludG8gYSBzZXQgb2YgcmVjb3JkcyB0aGF0IGFyZQo+IGFsbCByZWxhdGVkIHRv
IGdpdmUgYSBsYXJnZXIgcGljdHVyZSBvZiB0aGUgY2lyY3Vtc3RhbmNlcyBvZiB0aGF0IGV2ZW50
Lgo+IENvbmZpZ3VyYXRpb24gY2hhbmdlcywgYmVpbmcgYXVkaXQgcnVsZXMgYWRkZWQsIG9yIGZp
cmV3YWxsIHJ1bGVzCj4gY2hhbmdlcywgYXJlIGhhcmR3aXJlZC4KPgo+ID4gSSBob3BlIHRoYXQg
aGVscHMuCj4gPgo+ID4gLS0KPiA+IHBhdWwtbW9vcmUuY29tCj4gPgo+Cj4gLSBSR0IKPgo+IC0t
Cj4gUmljaGFyZCBHdXkgQnJpZ2dzIDxyZ2JAcmVkaGF0LmNvbT4KPiBTci4gUy9XIEVuZ2luZWVy
LCBLZXJuZWwgU2VjdXJpdHksIEJhc2UgT3BlcmF0aW5nIFN5c3RlbXMKPiBSZW1vdGUsIE90dGF3
YSwgUmVkIEhhdCBDYW5hZGEKPiBJUkM6IHJnYiwgU3VuUmF5Y2VyCj4gVm9pY2U6ICsxLjY0Ny43
NzcuMjYzNSwgSW50ZXJuYWw6ICg4MSkgMzI2MzUKPgoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBs
aXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1hdWRpdAo=

