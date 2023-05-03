Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 132746F6075
	for <lists+linux-audit@lfdr.de>; Wed,  3 May 2023 23:14:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683148471;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rxyFeIv/C+jPs5SzlLJkvg7EPjEmWWXMMJCs3pKcz8I=;
	b=U0xR864t3eUoSha1bATV25wajtmc2Kewafcd/Q1QzQdDP7AVIYsUO2p8AmR/fMPlg67LCK
	ly9PcB+vDSB7OIaOGw3H519CZQm/Ybm0edTdCDLtedYPyUAnP9D6D57UoVf6LLBNcc0jew
	Ta6SIXrl7w55ObLM4H+fpOOBP/Sp9YE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-EV-ntUAHMuKVU8ROKdiZTQ-1; Wed, 03 May 2023 17:14:28 -0400
X-MC-Unique: EV-ntUAHMuKVU8ROKdiZTQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1A9D185A79C;
	Wed,  3 May 2023 21:14:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F1E9C2026D25;
	Wed,  3 May 2023 21:14:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8921E1946A44;
	Wed,  3 May 2023 21:14:15 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8BF0D19465BB for <linux-audit@listman.corp.redhat.com>;
 Wed,  3 May 2023 21:14:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3F0F740C6E68; Wed,  3 May 2023 21:14:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3783A40C6E67
 for <linux-audit@redhat.com>; Wed,  3 May 2023 21:14:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C271101A531
 for <linux-audit@redhat.com>; Wed,  3 May 2023 21:14:13 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-mnnwB1eqPs6Ic_oIjhrpsw-1; Wed, 03 May 2023 17:14:11 -0400
X-MC-Unique: mnnwB1eqPs6Ic_oIjhrpsw-1
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-4efd6e26585so6676656e87.1
 for <linux-audit@redhat.com>; Wed, 03 May 2023 14:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683148449; x=1685740449;
 h=content-transfer-encoding:subject:from:content-language:to
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CxpNUIdlDEabfdkFnlU52P73YKGixOMQRINFx/TdyNM=;
 b=MAzQ0D8hNwc3ikZk8hw/+NuaWNdsQUgqzWJTtEHYyFL6h65dDgbjEJYr1Q9nx+skEU
 B9SkuRD5tgICp1Ci6s8brvAHvShN5ALjeTHY4u41K2vQULOO1k+7owsAbutRsnDQs6oJ
 RbMjQp6WSIVtVDeV4tG88wgYCJYAviC0k21kDcqqg1ckzbrAlXzSqVHtVE7Y9q3VJDOe
 polTYrytghhlZgtrter2wwofnzhmbuVS4MrGrH8szQdkL0U3BrUbTE1qKRMb/AzfI9uu
 YiDgE/CECwuF+1nbPePhTpyX3uZB/AAMUaW1wkhuwTEeUKnqCBFWOn9FISCggZfZZe2g
 IjaA==
X-Gm-Message-State: AC+VfDyElg2UAJN3eIk11UniUYLpaeUrHFgZnCvsVNxNstsAxNHT+GTH
 Kt5fy7r+aPG/go/tG+G7ls/zI4CAJV7KGw==
X-Google-Smtp-Source: ACHHUZ5MHernTLczsM7yJKmxx/AqD2YtbKLgm7cqEf+RsSDHVslbf0y3i0RB3I7RnnPIr3rlcYiVeQ==
X-Received: by 2002:ac2:5ec2:0:b0:4dd:af71:a5b7 with SMTP id
 d2-20020ac25ec2000000b004ddaf71a5b7mr1301573lfq.41.1683148449282; 
 Wed, 03 May 2023 14:14:09 -0700 (PDT)
Received: from [192.168.0.31] ([94.242.171.165])
 by smtp.gmail.com with ESMTPSA id
 o22-20020ac24356000000b004edd490cf77sm6164756lfl.275.2023.05.03.14.14.08
 for <linux-audit@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 14:14:08 -0700 (PDT)
Message-ID: <ecd4bf68-3bf1-a1d8-4da5-5fbd28c51a6b@gmail.com>
Date: Thu, 4 May 2023 00:14:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: linux-audit@redhat.com
From: Rinat Gadelshin <rgadelsh@gmail.com>
Subject: Can AUDIT_LIST_RULES causes kthreadd-spam?
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
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US, ru-RU
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

SGVsbG8gdGhlcmUgPSkKCgpNeSBuYW1lIGlzIFJpbmF0LgpJJ20gYSBuZXdiaWUgaGVyZSAoYXQg
TGludXgga2VybmVsIGRldmVsb3BlciBjb21tdW5pdHkpLgoKTXkgY3VycmVudCBqb2IgaXMgdG8g
d29yayB3aXRoIGF1ZGl0IHN1YnN5c3RlbSBvbiBkaWZmZXJlbnQKdmVyc2lvbnMgb2YgTGludXgg
KGFuZCBkaWZmZXJlbnQga2VybmVsIHZlcnNpb25zIGZyb20gMy4xMCB0byB0aGUgbGF0ZXN0KQp3
aXRoIGFuZCB3aXRob3V0IGF1ZGl0ZC4KCk15IHByb2dyYW0gd29ya3MgYmVoYWxmIG9mIHJvb3Qg
YWNjb3VudCBhbmQgdXNlcyBuZXRsaW5rCih1bmljYXN0IG9yIG11bHRpY2FzdCBkZXBlbmRzIG9m
wqAgdGhlIGtlcm5lbCdzIHZlcnNpb24pCnRvIGNvbW11bmljYXRlIHdpdGggYXVkaXQgc3Vic3lz
dGVtIG9mIHRoZSBrZXJuZWwuCgpJZiBhY3R1YWwgYXVkaXQgcnVsZSBsaXN0IGhhcyBiZWVuIGNo
YW5nZWQKdGhlbiBteSBwcm9ncmFtIHNob3VsZCByZXN0b3JlIHRoZSBjb25maWd1cmVkIGF1ZGl0
IHJ1bGUgbGlzdC4KClRvIGRvIGl0IHRoZSBwcm9ncmFtIHBlcmlvZGljYWxseSAod2l0aCA2MCBz
ZWNvbmRzIGludGVydmFsKQpyZXF1ZXN0cyB0aGUgYWN0dWFsIHJ1bGUgbGlzdCBiZSBzZW5kaW5n
IEFVRElUX0xJU1RfUlVMRVMuCgpBbGwgcnVsZXMgYXJlIHJlY2VpdmluZyBwZXJmZWN0bHkuCgpC
dXQgSSd2ZSBub3RpY2VkIHRoYXQgdGhlcmUgYXJlIG1hbnkgKDJLKyBmb3IgNSBtaW51dGVzIHRl
c3QpCmt0aHJlYWRkIHByb2Nlc3MgaGF2ZSBiZWVuIHNwYXduZWQgYWZ0ZXIgdGhhdCByZXF1ZXN0
CihJJ3ZlIHN0dWJiZWQgdGhlIHBvbGwgY29kZSBhbmQgY29tcGFyZSBsb2dzKS4KClBsZWFzZSwg
Y2FuIHlvdSBwb2ludCBtZSwgd2hhdCBjYW4gSSBkbyB0byBhdm9pZCB0aGlzIGt0aHJlYWRkLXNw
YW0uCgoKVGhhbmsgeW91LgoKQmVzdCByZWdhcmRzClJpbmF0aAoKLS0KTGludXgtYXVkaXQgbWFp
bGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdAo=

