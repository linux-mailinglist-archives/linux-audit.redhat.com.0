Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9CC6F3273
	for <lists+linux-audit@lfdr.de>; Mon,  1 May 2023 17:06:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682953571;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hkjGXSKk45ZojYM/UEYS+BoZxzALtwqlRMdYlYeeuqM=;
	b=VETrNpQYbCZu7yOvk/500gbataPRt0lfDGMxRVFvEvH3YbejYM8PG3LsNWr0v1so7dtZ16
	A3BlrXXN0JxLUtVHdhhWY6/7GJ6lwa44v3nkaU0djgCATAMWT5pI7H1Cko4t8r4g5aMXLJ
	FATjU1NEaSkot7I/xHLyemCHKgE5Kt0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-y2oz1LTjPk6Y7CO_ZSh-ug-1; Mon, 01 May 2023 11:04:53 -0400
X-MC-Unique: y2oz1LTjPk6Y7CO_ZSh-ug-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88477A0F3A7;
	Mon,  1 May 2023 15:02:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 06DC514171B6;
	Mon,  1 May 2023 15:02:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7114A19465A2;
	Mon,  1 May 2023 15:02:14 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EABBF1946587 for <linux-audit@listman.corp.redhat.com>;
 Mon,  1 May 2023 15:02:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D9FE52166B29; Mon,  1 May 2023 15:02:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D13BA2166B26
 for <linux-audit@redhat.com>; Mon,  1 May 2023 15:02:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5222857FB3
 for <linux-audit@redhat.com>; Mon,  1 May 2023 15:02:12 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-0wfmHd-zM46Ys7aMgOC3yA-1; Mon, 01 May 2023 11:02:01 -0400
X-MC-Unique: 0wfmHd-zM46Ys7aMgOC3yA-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-3ee15d30190so12784151cf.1
 for <linux-audit@redhat.com>; Mon, 01 May 2023 08:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682953307; x=1685545307;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:to:subject:reply-to:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=GKtXu10F9Q9NlZfAaTDpZJuIonVGvBYI+ADmsYCwLRI=;
 b=R7rBEkkniFSsrkrjRVA7f7fGMJsmPUi02fa3kikxfo+RwY5ciuBYwhqYUA0/0r+uak
 Yi71yvpbVd9SsptCSh48kTxHVAF84dKb/F9pTbZn5+LZqY7GOlFTJ+T4lD57yahaLE1h
 H3TVw4WSAXHxjgezsn4Hz/jv2y/qlypS+yMc022xnXtRdsq3Ot9sz56fsw0q3m+p7rDr
 Mr4FxNmO+DdUj5wZwEsOYOuzhy5vAlrkyTx+rsHJbjMPe+9qc6bL8p50IJ0PMDSqh/sX
 7yKM5Ffqm8ZKFwdIz7+uJLSDg2CFADXRo/Av3jA3To2KfvfsClGUyNF5zUnJaWHkR4a0
 JboA==
X-Gm-Message-State: AC+VfDyvJ+u6NBtpZK3qNABZVJG0fnqIAHtiGIpLmBd2Em9mZChyT2LN
 5WTFh+LTSzkNL75ONuwVC/Mp1NHVoWKIEEftBuO3TZI2sPlCxVbT3bf055QEHNxKcG6poIyYEnL
 SVE41bpoXNoV3qB/FkghP7ahIPS/D/bskmcfZZ7nGO7fE4faqU9kPTD7+DxP4F92vkpD7YCawGs
 87
X-Received: by 2002:a05:622a:507:b0:3ef:3bad:6d0c with SMTP id
 l7-20020a05622a050700b003ef3bad6d0cmr21339680qtx.67.1682953306867; 
 Mon, 01 May 2023 08:01:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4TOoU/4pKTmLgbfGIs3F9eXZSKEqq8ZyY1k9/qVR7MNC8MBx3gg4AkLKCLmaSESO/KfiXnIg==
X-Received: by 2002:a05:622a:507:b0:3ef:3bad:6d0c with SMTP id
 l7-20020a05622a050700b003ef3bad6d0cmr21339537qtx.67.1682953305882; 
 Mon, 01 May 2023 08:01:45 -0700 (PDT)
Received: from [192.168.1.24] (cpe-74-65-135-63.maine.res.rr.com.
 [74.65.135.63]) by smtp.gmail.com with ESMTPSA id
 y18-20020a05620a09d200b0074bcf3ac7casm8890069qky.44.2023.05.01.08.01.44
 for <linux-audit@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 08:01:45 -0700 (PDT)
Message-ID: <c7d87c7c-f475-eb90-e4ba-8bb13c035488@redhat.com>
Date: Mon, 1 May 2023 11:01:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: "service auditd start" fails inside a container
To: linux-audit@redhat.com
References: <CABvEhECpywJRHDW6dFZU8Q3_rCZ0MpG45UQVu8fgH7ENSK37dA@mail.gmail.com>
 <4526563.LvFx2qVVIh@x2>
From: Daniel Walsh <dwalsh@redhat.com>
Organization: Red Hat
In-Reply-To: <4526563.LvFx2qVVIh@x2>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Reply-To: dwalsh@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gNC8yOC8yMyAxNDo0OCwgU3RldmUgR3J1YmIgd3JvdGU6Cj4gT24gRnJpZGF5LCBBcHJpbCAy
OCwgMjAyMyAzOjU0OjMyIEFNIEVEVCDmsZ/mnaggd3JvdGU6Cj4+IE1heSBJIGFzayBpZiBBdWRp
dGQgc3VwcG9ydHMgRG9ja2VyPyBUaGFuayB5b3UKPj4gaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5j
b20vYXJjaGl2ZXMvbGludXgtYXVkaXQvMjAxOC1KdWx5L21zZzAwMDc4Lmh0bWwKPiBUaGVyZSBp
cyBubyBhY3RpdmUgd29yayB0aGF0IEkga25vdyBvZiB0byBwdXQgYXVkaXRkIGluIGEgY29udGFp
bmVyLiBJdCdzCj4gbGlicmFyaWVzIGFyZSB1c2VkIGJ5IG1hbnkgYXBwbGljYXRpb25zLiBTbywg
SSBkb24ndCBrbm93IHdoYXQgdXNlIGl0IHdvdWxkCj4gYmUgdG8gY29udGFpbmVyaXplIGl0Lgo+
Cj4gQW5kIGlmIHlvdSBhcmUgYXNraW5nIGlmIGF1ZGl0ZCBjYW4gYXVkaXQgZXZlbnRzIGluIGEg
Y29udGFpbmVyLCBJIHRoaW5rIHRoYXQKPiBhbnN3ZXIgaXMgYWxzbyBuby4KPgo+IC1TdGV2ZQo+
Cj4KPiAtLQo+IExpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdAo+IExpbnV4LWF1ZGl0QHJlZGhhdC5j
b20KPiBodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1
ZGl0CgpJIGRvbid0IGJlbGlldmUgdGhlcmUgaXMgYW55dGhpbmcgdG8gcHJldmVudCBhdWRpdGQg
ZnJvbSBydW5uaW5nIHdpdGhpbiAKYSBjb250YWluZXIuwqAgWW91IGNhbiB0dXJuIHVwIGFuZCBk
b3duIHRoZSBjb250YWluZXIgdG8gbWFueSBkaWZmZXJlbnQgCmxldmVscyBvciBzZWN1cml0eSBz
ZXBhcmF0aW9uLiBUaGVyZSB3aWxsIGJlIHNvbWUgc2VjdXJpdHkgdGhpbmdzIHRoYXQgCm5lZWQg
dG8gYmUgdHVybmVkIG9mZi4KClJ1bm5pbmcgYSBjb250aWFuZXIgcHJpdmlsZWdlZCB3aWxsIHR1
cm4gb2ZmIGFsbW9zdCBldmVyeXRoaW5nIGZvcm0gYSAKc2VjdXJpdHkgcGVyc3BlY3RpdmUsIGFu
ZCB0aGVuIHJ1bm5pbmcgd2l0aCBzb21lIG9mIHRoZSBuYW1lc3BhY2VzIApzaGFyZWQgd2l0aCB0
aGUgaG9zdC4KClNvbWV0aGluZyBsaWtlCgpwb2RtYW4gcnVuIC0tcHJpdmlsZWdlZCAtLW5ldHdv
cms9aG9zdCAtLXBpZD1ob3N0IC4uLiBhdWRpdGltYWdlCgpTaG91bGQgd29yay4KCkxhdGVyIHRp
Z2h0ZW5pbmcgdXAgdGhlIHNlY3VyaXR5IHNob3VsZCBhbHNvIGJlIHBvc3NpYmxlLCBidXQgeW91
IHdvdWxkIApuZWVkIHRvIGtub3cgd2hhdCBhdWRpdGQgbmVlZHMgYWNjZXNzIHRvLgoKV2l0aCBh
bGwgdGhhdCBzYWlkLCBJIGFtIG5vdCBzdXJlIHdoYXQgeW91IGFyZSB0cnlpbmcgdG8gYWNoaWV2
ZSBieSAKY29udGFpbmVyaXppbmcgdGhlIGF1ZGl0IGRhZW1vbi4KCi0tCkxpbnV4LWF1ZGl0IG1h
aWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQu
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQK

