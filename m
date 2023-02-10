Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6CD691FA4
	for <lists+linux-audit@lfdr.de>; Fri, 10 Feb 2023 14:17:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676035024;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BI97yVcp1AFhsBvy0UGrfVCOlJft8Sg/OAXiZu2UwpA=;
	b=FP1NiukmEbjbAFQoTggRXh4X9ExJWTvAasV0STp+EBdXEdqnPoKwF7beiHsFbQX91Mg3wK
	0ymikrQfMRX2pr/MoqQcYByXNmYYNBc0rMt+MBlj4qRHEjtoReks8+7XM3vruYF9xmZkUh
	aiYoSTb3zcDgEYyjISDxNch+wo1VM+A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-xXe-httOPGCk1-9o7FnbTQ-1; Fri, 10 Feb 2023 08:16:31 -0500
X-MC-Unique: xXe-httOPGCk1-9o7FnbTQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 401DC811E9C;
	Fri, 10 Feb 2023 13:16:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 18D1C403D0C5;
	Fri, 10 Feb 2023 13:16:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 19F7E19465B6;
	Fri, 10 Feb 2023 13:15:56 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D41751946589 for <linux-audit@listman.corp.redhat.com>;
 Fri, 10 Feb 2023 00:15:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C484B492B01; Fri, 10 Feb 2023 00:15:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCAE3492C3E
 for <linux-audit@redhat.com>; Fri, 10 Feb 2023 00:15:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F17F382C973
 for <linux-audit@redhat.com>; Fri, 10 Feb 2023 00:15:58 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-448-PU1TdhmVO1i2oRUAg_bQTw-1; Thu, 09 Feb 2023 19:15:56 -0500
X-MC-Unique: PU1TdhmVO1i2oRUAg_bQTw-1
Received: by mail-pl1-f181.google.com with SMTP id w5so4770349plg.8
 for <linux-audit@redhat.com>; Thu, 09 Feb 2023 16:15:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1675988155;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tNPbNYoCct7d8eWLCTkz69o5QdTPIXkMuLL30IOxMRg=;
 b=Db9q+Bbo0dShm4f21mf/FtTNGL+6fsimJFwnZs1V4Va/5d6gI8qdNS6cnplEZzyKCr
 ieHEwPG4oQhJdS+LgBQcGDTxKGcd64fhD0UrVeij2sjHIXfL4vnFyBtTtmP7YBtc2rsx
 YOJurtLDRFnY4N70HCLX44VA3+JOYaApO6d3nhL09uTzlGUwINjMVdcVrMwLaS+kg5B+
 UBGznYt5tgZRrZ/W/UUYc8/NpgxNZmCNV/LIo4N/xJlWw6EDROSnuzYlUwSn24DakS08
 jF1pmDo7oiOx1l7jiOf7U0XfRKyvj6a6KSGY2Xdq7TTVhIb3T4ZlO6tTPmgjUWq7P3bX
 nMRQ==
X-Gm-Message-State: AO0yUKXbaLWYj7avkyjCiu28h0XCLFHb/n/kdCXNdNbOCPqJ6BGZfeVN
 1RysKrShHSNydFbxcs207nysUQ==
X-Google-Smtp-Source: AK7set9i4GZy425eJQ60VEHt8ZyiMscBINILO96QjW9OdkxX3UWegtHHMx/XPbkaa3kfxkBKfne7wA==
X-Received: by 2002:a17:903:32c3:b0:199:4362:93f6 with SMTP id
 i3-20020a17090332c300b00199436293f6mr9399565plr.4.1675988155556; 
 Thu, 09 Feb 2023 16:15:55 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 jj5-20020a170903048500b00198d5c7cafasm2109067plb.156.2023.02.09.16.15.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 16:15:55 -0800 (PST)
Message-ID: <6939adfb-ce2c-1911-19ee-af32f7d9a5ca@kernel.dk>
Date: Thu, 9 Feb 2023 17:15:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] io_uring,audit: don't log IORING_OP_MADVISE
To: Steve Grubb <sgrubb@redhat.com>, Richard Guy Briggs <rgb@redhat.com>,
 Paul Moore <paul@paul-moore.com>
References: <b5dfdcd541115c86dbc774aa9dd502c964849c5f.1675282642.git.rgb@redhat.com>
 <Y+VrSLZKZoAGikUS@madcap2.tricolour.ca>
 <CAHC9VhTNb4gOpk9=49-ABtYs1DFKqqwXPSc-2bhJX7wcZ82o=g@mail.gmail.com>
 <13293926.uLZWGnKmhe@x2>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <13293926.uLZWGnKmhe@x2>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Fri, 10 Feb 2023 13:15:55 +0000
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
Cc: Christian Brauner <brauner@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Audit Mailing List <linux-audit@redhat.com>, Stefan Roesch <shr@fb.com>,
 Eric Paris <eparis@parisplace.org>, io-uring@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMi85LzIzIDM6NTTigK9QTSwgU3RldmUgR3J1YmIgd3JvdGU6Cj4gT24gVGh1cnNkYXksIEZl
YnJ1YXJ5IDksIDIwMjMgNTozNzoyMiBQTSBFU1QgUGF1bCBNb29yZSB3cm90ZToKPj4gT24gVGh1
LCBGZWIgOSwgMjAyMyBhdCA0OjUzIFBNIFJpY2hhcmQgR3V5IEJyaWdncyA8cmdiQHJlZGhhdC5j
b20+IHdyb3RlOgo+Pj4gT24gMjAyMy0wMi0wMSAxNjoxOCwgUGF1bCBNb29yZSB3cm90ZToKPj4+
PiBPbiBXZWQsIEZlYiAxLCAyMDIzIGF0IDM6MzQgUE0gUmljaGFyZCBHdXkgQnJpZ2dzIDxyZ2JA
cmVkaGF0LmNvbT4gCj4gd3JvdGU6Cj4+Pj4+IGZhZHZpc2UgYW5kIG1hZHZpc2UgYm90aCBwcm92
aWRlIGhpbnRzIGZvciBjYWNoaW5nIG9yIGFjY2VzcyBwYXR0ZXJuCj4+Pj4+IGZvciBmaWxlIGFu
ZCBtZW1vcnkgcmVzcGVjdGl2ZWx5LiAgU2tpcCB0aGVtLgo+Pj4+Cj4+Pj4gWW91IGZvcmdvdCB0
byB1cGRhdGUgdGhlIGZpcnN0IHNlbnRlbmNlIGluIHRoZSBjb21taXQgZGVzY3JpcHRpb24gOi8K
Pj4+Cj4+PiBJIGRpZG4ndCBmb3JnZXQuICBJIHVwZGF0ZWQgdGhhdCBzZW50ZW5jZSB0byByZWZs
ZWN0IHRoZSBmYWN0IHRoYXQgdGhlCj4+PiB0d28gc2hvdWxkIGJlIHRyZWF0ZWQgc2ltaWxhcmx5
IHJhdGhlciB0aGFuIGRpZmZlcmVudGx5Lgo+Pgo+PiBPb29va2F5LiAgQ2FuIHdlIGF0IGxlYXN0
IGFncmVlIHRoYXQgdGhlIGNvbW1pdCBkZXNjcmlwdGlvbiBzaG91bGQgYmUKPj4gcmVwaHJhc2Vk
IHRvIG1ha2UgaXQgY2xlYXIgdGhhdCB0aGUgcGF0Y2ggb25seSBhZGp1c3RzIG1hZHZpc2U/ICBS
aWdodAo+PiBub3cgSSByZWFkIHRoZSBjb21taXQgZGVzY3JpcHRpb24gYW5kIGl0IHNvdW5kcyBs
aWtlIHlvdSBhcmUgYWRqdXN0aW5nCj4+IHRoZSBiZWhhdmlvciBmb3IgYm90aCBmYWR2aXNlIGFu
ZCBtYWR2aXNlIGluIHRoaXMgcGF0Y2gsIHdoaWNoIGlzIG5vdAo+PiB0cnVlLgo+Pgo+Pj4+IEkn
bSBzdGlsbCBsb29raW5nIGZvciBzb21lIHR5cGUgb2Ygc3RhdGVtZW50IHRoYXQgeW91J3ZlIGRv
bmUgc29tZQo+Pj4+IGhvbWV3b3JrIG9uIHRoZSBJT1JJTkdfT1BfTUFEVklTRSBjYXNlIHRvIGVu
c3VyZSB0aGF0IGl0IGRvZXNuJ3QgZW5kCj4+Pj4gdXAgY2FsbGluZyBpbnRvIHRoZSBMU00sIHNl
ZSBteSBwcmV2aW91cyBlbWFpbHMgb24gdGhpcy4gIEkgbmVlZCBtb3JlCj4+Pj4gdGhhbiAiU3Rl
dmUgdG9sZCBtZSB0byBkbyB0aGlzIi4KPj4+Pgo+Pj4+IEkgYmFzaWNhbGx5IGp1c3Qgd2FudCB0
byBzZWUgdGhhdCBzb21lIGNhcmUgYW5kIHRob3VnaHQgaGFzIGdvbmUgaW50bwo+Pj4+IHRoaXMg
cGF0Y2ggdG8gdmVyaWZ5IGl0IGlzIGNvcnJlY3QgYW5kIGdvb2QuCj4+Pgo+Pj4gU3RldmUgc3Vn
Z2VzdGVkIEkgbG9vayBpbnRvIGEgbnVtYmVyIG9mIGlvdXJpbmcgb3BzLiAgSSBsb29rZWQgYXQg
dGhlCj4+PiBkZXNjcmlwdGlvbiBjb2RlIGFuZCBhZ3JlZWQgdGhhdCBpdCB3YXNuJ3QgbmVjZXNz
YXJ5IHRvIGF1ZGl0IG1hZHZpc2UuCj4+PiBUaGUgcmF0aW9uYWxlIGZvciBmYWR2aXNlIHdhcyBk
ZXRlbWluZWQgdG8gaGF2ZSBiZWVuIGNvbmZsYXRlZCB3aXRoCj4+PiBmYWxsb2NhdGUgYW5kIHN1
YnNlcXVlbnRseSBkcm9wcGVkLiAgU3RldmUgYWxzbyBzdWdnZXN0ZWQgYSBudW1iZXIgb2YKPj4+
IG90aGVycyBhbmQgYWZ0ZXIgaW52ZXN0aWdhdGlvbiBJIGRlY2lkZWQgdGhhdCB0aGVpciBjdXJy
ZW50IHN0YXRlIHdhcwo+Pj4gY29ycmVjdC4gICpnZXR4YXR0ciB5b3UndmUgYWR2aXNlZCBhZ2Fp
bnN0LCBzbyBpdCB3YXMgZHJvcHBlZC4gIEl0Cj4+PiBhcHBlYXJzIGZld2VyIG1vZGlmaWNhdGlv
bnMgd2VyZSBuZWNlc3NhcnkgdGhhbiBvcmlnaW5hbGx5IHN1c3BlY3RlZC4KPj4KPj4gTXkgY29u
Y2VybiBpcyB0aGF0IHRocmVlIG9mIHRoZSBmb3VyIGNoYW5nZXMgeW91IGluaXRpYWxseSBwcm9w
b3NlZAo+PiB3ZXJlIHJlamVjdGVkLCB3aGljaCBnaXZlcyBtZSBwYXVzZSBhYm91dCB0aGUgZm91
cnRoLiAgWW91IG1lbnRpb24KPj4gdGhhdCBiYXNlZCBvbiB5b3VyIHJlYWRpbmcgb2YgbWFkdmlz
ZSdzIGRlc2NyaXB0aW9uIHlvdSBmZWVsIGF1ZGl0aW5nCj4+IGlzbid0IG5lY2Vzc2FyeSAtIGFu
ZCB5b3UgbWF5IGJlIHJpZ2h0IC0gYnV0IGJhc2VkIG9uIG91ciBleHBlcmllbmNlCj4+IHNvIGZh
ciB3aXRoIHRoaXMgcGF0Y2hzZXQgSSB3b3VsZCBsaWtlIHRvIGhlYXIgdGhhdCB5b3UgaGF2ZSBw
cm9wZXJseQo+PiBpbnZlc3RpZ2F0ZWQgYWxsIG9mIHRoZSBtYWR2aXNlIGNvZGUgcGF0aHMsIGFu
ZCBJIHdvdWxkIGxpa2UgdGhhdCBpbgo+PiB0aGUgY29tbWl0IGRlc2NyaXB0aW9uLgo+IAo+IEkg
dGhpbmsgeW91J3JlIGJlaW5nIHVubmVjZXNzYXJpbHkgaGFyZCBvbiB0aGlzLiBZZXMsIHRoZSBj
b21taXQgbWVzc2FnZSAKPiBtaWdodCBiZSB0b3VjaGVkIHVwLiBCdXQgbWFkdmlzZSBpcyBhZHZp
c29yeSBpbiBuYXR1cmUuIEl0IGlzIG5vdCBzZWN1cml0eSAKPiByZWxldmFudC4gQW5kIGEgZ3Jl
cCB0aHJvdWdoIHRoZSBzZWN1cml0eSBkaXJlY3RvcnkgZG9lc24ndCB0dXJuIHVwIGFueSAKPiBo
b29rcy4KCkFncmVlLCBpdCdzIGdldHRpbmcgYSBiaXQgYW5hbC4uLiBGV0lXLCBwYXRjaCBsb29r
cyBmaW5lIHRvIG1lLgoKLS0gCkplbnMgQXhib2UKCgotLQpMaW51eC1hdWRpdCBtYWlsaW5nIGxp
c3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==

