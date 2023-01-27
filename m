Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF4967F988
	for <lists+linux-audit@lfdr.de>; Sat, 28 Jan 2023 17:23:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674923029;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=D8ogEWRBOqCYpoMAmtkXOz6y+FvFeBc30bxQ1PpDwOE=;
	b=Nrr00Y3OKQiD1KI+vsOZHfLr5NBJBWonL12nBIYlQ27GLRB0GR2zeIXg0o5/ji8hqvEmDt
	y4ifZFUj+bBaMHJTl9VlLyGdpIYhTHBY7mPGngA35nHYxPc//c5o2vjSKAfSPk6rOLojWb
	qTNhKiMbPqtmiz6je4hFawjzqkYDUFA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-vRSsG1BaPVmy4j0Wfc1CdA-1; Sat, 28 Jan 2023 11:23:46 -0500
X-MC-Unique: vRSsG1BaPVmy4j0Wfc1CdA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11F99811E9C;
	Sat, 28 Jan 2023 16:23:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F187F40C200E;
	Sat, 28 Jan 2023 16:23:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DBF2A1946587;
	Sat, 28 Jan 2023 16:23:34 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 37362194658C for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 22:46:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2781240C200D; Fri, 27 Jan 2023 22:46:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F98040C200C
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 22:46:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05142100F90B
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 22:46:58 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-256-F3qPUq15NWajtP0Nks9L4A-1; Fri, 27 Jan 2023 17:46:56 -0500
X-MC-Unique: F3qPUq15NWajtP0Nks9L4A-1
Received: by mail-pl1-f170.google.com with SMTP id g23so6390912plq.12
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 14:46:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=niyqz/K5CU31qmYp0re26rzgWDGptmZo9A3vBPWvlao=;
 b=53xxBn/whzg+/gyEQiY+4xXMgFUK5EVfqu/b31qgRm2++SnmHNglYHhINSUSpJelx5
 YGClFDKJu2Z7ipD5pF36GyPF/biNTd7PRQFFeXnlJtQwAWc5hdxVS6Z8QsdPwxduHFce
 VywDpg7n2WNaPStiWq5tZJw5ZZlBsGMD1wY6EMXsxEDNkTAFLeATUklk1Nov+jz/gXxs
 G1rs9ImKsW6fXxb48OLnvC5Yjj8PXoqb5siZ7TqfGeBoVgzKAC9wriEpEa60es3G0ok6
 IOFkmvuxkfKXBeeWrdtRrpPfOC3DlohMV0SojCgXp0/xEph4c9b57PpfjK3EwvQzL246
 kOxA==
X-Gm-Message-State: AFqh2kp6GLIl5I54rOGVNgxyIXrWF2SiISzFfMZD1io4AnEztBDeGcgz
 Q17nZ0tSqSUKrpMPZTPgjHY8dw==
X-Google-Smtp-Source: AMrXdXu35TH37NebANPn49PtseEAfXGCyWnrluC2tGjrOzbesGJXDQn9RBkDExFcV+imMwWeZukDyw==
X-Received: by 2002:a05:6a20:2d1f:b0:b9:478e:545b with SMTP id
 g31-20020a056a202d1f00b000b9478e545bmr9035600pzl.6.1674859615088; 
 Fri, 27 Jan 2023 14:46:55 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 h70-20020a628349000000b00574e84ed847sm1264205pfe.24.2023.01.27.14.46.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 14:46:54 -0800 (PST)
Message-ID: <d9da8035-ed81-fb28-bf3a-f98c8a1e044a@kernel.dk>
Date: Fri, 27 Jan 2023 15:46:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 0/2] two suggested iouring op audit updates
To: Paul Moore <paul@paul-moore.com>
References: <cover.1674682056.git.rgb@redhat.com>
 <da695bf4-bd9b-a03d-3fbc-686724a7b602@kernel.dk>
 <CAHC9VhSRbay5bEUMJngpj+6Ss=WLeRoyJaNNMip+TyTkTJ6=Lg@mail.gmail.com>
 <24fbe6cb-ee80-f726-b260-09f394ead764@kernel.dk>
 <CAHC9VhRuvV9vjhmTM4eGJkWmpZmSkgVaoQ=L6g3cahej-F52tQ@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAHC9VhRuvV9vjhmTM4eGJkWmpZmSkgVaoQ=L6g3cahej-F52tQ@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Sat, 28 Jan 2023 16:23:32 +0000
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
Cc: Christian Brauner <brauner@kernel.org>, Richard Guy Briggs <rgb@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, Pavel Begunkov <asml.silence@gmail.com>,
 Linux-Audit Mailing List <linux-audit@redhat.com>, Stefan Roesch <shr@fb.com>,
 Eric Paris <eparis@parisplace.org>, io-uring@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMS8yNy8yMyAzOjM44oCvUE0sIFBhdWwgTW9vcmUgd3JvdGU6Cj4gT24gRnJpLCBKYW4gMjcs
IDIwMjMgYXQgMjo0MyBQTSBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+IHdyb3RlOgo+PiBP
biAxLzI3LzIzIDEyOjQy4oCvUE0sIFBhdWwgTW9vcmUgd3JvdGU6Cj4+PiBPbiBGcmksIEphbiAy
NywgMjAyMyBhdCAxMjo0MCBQTSBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+IHdyb3RlOgo+
Pj4+IE9uIDEvMjcvMjMgMTA6MjPigK9BTSwgUmljaGFyZCBHdXkgQnJpZ2dzIHdyb3RlOgo+Pj4+
PiBBIGNvdXBsZSBvZiB1cGRhdGVzIHRvIHRoZSBpb3VyaW5nIG9wcyBhdWRpdCBieXBhc3Mgc2Vs
ZWN0aW9ucyBzdWdnZXN0ZWQgaW4KPj4+Pj4gY29uc3VsdGF0aW9uIHdpdGggU3RldmUgR3J1YmIu
Cj4+Pj4+Cj4+Pj4+IFJpY2hhcmQgR3V5IEJyaWdncyAoMik6Cj4+Pj4+ICAgaW9fdXJpbmcsYXVk
aXQ6IGF1ZGl0IElPUklOR19PUF9GQURWSVNFIGJ1dCBub3QgSU9SSU5HX09QX01BRFZJU0UKPj4+
Pj4gICBpb191cmluZyxhdWRpdDogZG8gbm90IGxvZyBJT1JJTkdfT1BfKkdFVFhBVFRSCj4+Pj4+
Cj4+Pj4+ICBpb191cmluZy9vcGRlZi5jIHwgNCArKystCj4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4KPj4+PiBMb29rIGZpbmUgdG8gbWUg
LSB3ZSBzaG91bGQgcHJvYmFibHkgYWRkIHN0YWJsZSB0byBib3RoIG9mIHRoZW0sIGp1c3QKPj4+
PiB0byBrZWVwIHRoaW5ncyBjb25zaXN0ZW50IGFjcm9zcyByZWxlYXNlcy4gSSBjYW4gcXVldWUg
dGhlbSB1cCBmb3IgNi4zLgo+Pj4KPj4+IFBsZWFzZSBob2xkIG9mZiB1bnRpbCBJJ3ZlIGhhZCBh
IGNoYW5jZSB0byBsb29rIHRoZW0gb3ZlciAuLi4KPj4KPj4gSSBoYXZlbid0IHRha2VuIGFueXRo
aW5nIHlldCwgZm9yIHRoaW5ncyBsaWtlIHRoaXMgSSBhbHdheXMgbGV0IGl0Cj4+IHNpbW1lciB1
bnRpbCBwZW9wbGUgaGF2ZSBoYWQgYSBjaGFuY2UgdG8gZG8gc28uCj4gCj4gVGhhbmtzLiAgRldJ
VywgdGhhdCBzb3VuZHMgdmVyeSByZWFzb25hYmxlIHRvIG1lLCBidXQgSSd2ZSBzZWVuIGxvdHMK
PiBvZiBkaWZmZXJlbnQgYmVoYXZpb3JzIGFjcm9zcyBzdWJzeXN0ZW1zIGFuZCB3YW50ZWQgdG8g
bWFrZSBzdXJlIHdlCj4gd2VyZSBvbiB0aGUgc2FtZSBwYWdlLgoKU291bmRzIGZhaXIuIEJUVywg
Y2FuIHdlIHN0b3AgQ0MnaW5nIGNsb3NlZCBsaXN0cyBvbiBwYXRjaApzdWJtaXNzaW9ucz8gR2V0
dGluZyB0aGVzZToKCllvdXIgbWVzc2FnZSB0byBMaW51eC1hdWRpdCBhd2FpdHMgbW9kZXJhdG9y
IGFwcHJvdmFsCgpvbiBldmVyeSByZXBseSBpcyByZWFsbHkgYW5ub3lpbmcuCgotLSAKSmVucyBB
eGJvZQoKCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29t
Cmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQK

