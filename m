Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 537DA6DF5AD
	for <lists+linux-audit@lfdr.de>; Wed, 12 Apr 2023 14:41:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681303307;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=b0x7of38/gfHZhU3h3+jgPu6WGponiyUFlMRLsApbwQ=;
	b=f5bWctltbYa/bRJj+zozPZorcRmkz3PqN/PJqbIhLO4zUVPhswFvffY7CN4idAIZVPlZOS
	oLEEaMgaL4vjWgmrmyq3FQ5u3sBtRlvp71a8nigvehe588e8gb5sX/NPiRFroeP/eo1Gwe
	aEy/iwRUBsMIzxZhl/AE0FG/xZ5eq5g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-z_OkCiYsPaKnohay6rG9pw-1; Wed, 12 Apr 2023 08:41:43 -0400
X-MC-Unique: z_OkCiYsPaKnohay6rG9pw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F2888996F8;
	Wed, 12 Apr 2023 12:41:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 13B86492B0F;
	Wed, 12 Apr 2023 12:41:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5A9C219465B3;
	Wed, 12 Apr 2023 12:41:40 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2EA4419466DF for <linux-audit@listman.corp.redhat.com>;
 Tue, 11 Apr 2023 23:08:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 132A32166B31; Tue, 11 Apr 2023 23:08:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B96A2166B30
 for <linux-audit@redhat.com>; Tue, 11 Apr 2023 23:08:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC1D23C02B6E
 for <linux-audit@redhat.com>; Tue, 11 Apr 2023 23:08:10 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-396n39IvMMu5QaHtoNcNvg-1; Tue, 11 Apr 2023 19:08:09 -0400
X-MC-Unique: 396n39IvMMu5QaHtoNcNvg-1
Received: by mail-yb1-f182.google.com with SMTP id v7so8462176ybi.0
 for <linux-audit@redhat.com>; Tue, 11 Apr 2023 16:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681254489; x=1683846489;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eIyxfCRdtVW6DZEqESNyM82Zcjpw6q1yxE2SLi7Q/10=;
 b=CUcVUqqp7H49hQKagOVj6zsxoBpSLvROCoLTpzIaIljw8W/tcxLMKBta7c4Y+s3hnN
 Ry6gbyQXD6UiuOEWVAyfhuxMcXK9RB2NLt0A+OFYMYBGNddETDYK5WdSXC8GDs7YbrF2
 15HXsxef75sjuwwgk/CsJUixjwGuAQxa2X/uDMKh+1aMbhAzsOcpOmvUfEpEIE6ODWgV
 +UK3tm+d1MJXA+s48O1INZmstYSOXgHOaqpFJvjxPU5pbn0QUng8v6ebZUDRUyZkbHXM
 d0XKXwexub4oMclQ+abOVPAJz9ud79HzQsgnsLbc+H0/U1ofIZvYzDYDDzqmQsanl138
 VB2A==
X-Gm-Message-State: AAQBX9ftZKu9XccYf9+LEbsveGMf8ywctG7/GZvrhwnvPOgWqRvmQdzZ
 NWze5gPMoPCzyAMKnDVmLSCLsrSk4THQ6O3o8On2
X-Google-Smtp-Source: AKy350YGpKFShus1wXg4P7JDpOEQwCA2ZUIAFxOOzluNG03DhrMlLa19ZC7t5ZHiN0J6rZ9Xc6wbx1W+NEq2mwRq1zY=
X-Received: by 2002:a25:d702:0:b0:b68:7a4a:5258 with SMTP id
 o2-20020a25d702000000b00b687a4a5258mr377571ybg.3.1681254488697; Tue, 11 Apr
 2023 16:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <1675119451-23180-8-git-send-email-wufan@linux.microsoft.com>
 <3723852.kQq0lBPeGt@x2>
 <CAHC9VhRqMrTuvVtwzJoK2U=6O1QuaQ8ceA6+qm=6ib0TOUEeSw@mail.gmail.com>
 <20230316225340.GB22567@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
In-Reply-To: <20230316225340.GB22567@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 11 Apr 2023 19:07:57 -0400
Message-ID: <CAHC9VhQxxrDnzJmUitMid3fk-VwNRU3NWoqjpj1=rhrtpoE=7w@mail.gmail.com>
Subject: Re: [RFC PATCH v9 07/16] uapi|audit|ipe: add ipe auditing support
To: Fan Wu <wufan@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Wed, 12 Apr 2023 12:34:31 +0000
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
Cc: axboe@kernel.dk, linux-security-module@vger.kernel.org, tytso@mit.edu,
 corbet@lwn.net, roberto.sassu@huawei.com,
 Deven Bowers <deven.desai@linux.microsoft.com>, linux-doc@vger.kernel.org,
 snitzer@kernel.org, jmorris@namei.org, zohar@linux.ibm.com,
 linux-kernel@vger.kernel.org, ebiggers@kernel.org, dm-devel@redhat.com,
 linux-audit@redhat.com, linux-block@vger.kernel.org, eparis@redhat.com,
 linux-fscrypt@vger.kernel.org, linux-integrity@vger.kernel.org, agk@redhat.com,
 serge@hallyn.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBNYXIgMTYsIDIwMjMgYXQgNjo1M+KAr1BNIEZhbiBXdSA8d3VmYW5AbGludXgubWlj
cm9zb2Z0LmNvbT4gd3JvdGU6Cj4gT24gVGh1LCBNYXIgMDIsIDIwMjMgYXQgMDI6MDU6MzNQTSAt
MDUwMCwgUGF1bCBNb29yZSB3cm90ZToKPiA+IE9uIFR1ZSwgSmFuIDMxLCAyMDIzIGF0IDEyOjEx
Pz8/UE0gU3RldmUgR3J1YmIgPHNncnViYkByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4g
SGVsbG8sCj4gPiA+Cj4gPiA+IE9uIE1vbmRheSwgSmFudWFyeSAzMCwgMjAyMyA1OjU3OjIyIFBN
IEVTVCBGYW4gV3Ugd3JvdGU6Cj4gPiA+ID4gRnJvbTogRGV2ZW4gQm93ZXJzIDxkZXZlbi5kZXNh
aUBsaW51eC5taWNyb3NvZnQuY29tPgo+ID4gPiA+Cj4gPiA+ID4gVXNlcnMgb2YgSVBFIHJlcXVp
cmUgYSB3YXkgdG8gaWRlbnRpZnkgd2hlbiBhbmQgd2h5IGFuIG9wZXJhdGlvbiBmYWlscywKPiA+
ID4gPiBhbGxvd2luZyB0aGVtIHRvIGJvdGggcmVzcG9uZCB0byB2aW9sYXRpb25zIG9mIHBvbGlj
eSBhbmQgYmUgbm90aWZpZWQKPiA+ID4gPiBvZiBwb3RlbnRpYWxseSBtYWxpY2lvdXMgYWN0aW9u
cyBvbiB0aGVpciBzeXN0ZW5zIHdpdGggcmVzcGVjdCB0byBJUEUKPiA+ID4gPiBpdHNlbGYuCj4g
PiA+ID4KPiA+ID4gPiBUaGUgbmV3IDE0MjAgYXVkaXQsIEFVRElUX0lQRV9BQ0NFU1MgaW5kaWNh
dGVzIHRoZSByZXN1bHQgb2YgYSBwb2xpY3kKPiA+ID4gPiBldmF1bGF0aW9uIG9mIGEgcmVzb3Vy
Y2UuIFRoZSBvdGhlciB0d28gZXZlbnRzLCBBVURJVF9NQUNfUE9MSUNZX0xPQUQsCj4gPiA+ID4g
YW5kIEFVRElUX01BQ19DT05GSUdfQ0hBTkdFIHJlcHJlc2VudCBhIG5ldyBwb2xpY3kgd2FzIGxv
YWRlZCBpbnRvIHRoZQo+ID4gPiA+IGtlcm5lbCBhbmQgdGhlIGN1cnJlbnRseSBhY3RpdmUgcG9s
aWN5IGNoYW5nZWQsIHJlc3BlY3RpdmVseS4KPiA+ID4KPiA+ID4gVHlwaWNhbGx5IHdoZW4geW91
IHJldXNlIGFuIGV4aXN0aW5nIHJlY29yZCB0eXBlLCBpdCBpcyBleHBlY3RlZCB0byBtYWludGFp
bgo+ID4gPiB0aGUgc2FtZSBmaWVsZHMgaW4gdGhlIHNhbWUgb3JkZXIuIEFsc28sIGl0IGlzIGV4
cGVjdCB0aGF0IGZpZWxkcyB0aGF0IGFyZQo+ID4gPiBjb21tb24gYWNyb3NzIGRpZmVyZW50IHJl
Y29yZHMgaGF2ZSB0aGUgc2FtZSBtZWFuaW5nLiBUbyBhaWQgaW4gdGhpcywgd2UgaGF2ZQo+ID4g
PiBhIGZpZWxkIGRpY3Rpb25hcnkgaGVyZToKPiA+ID4KPiA+ID4gaHR0cHM6Ly9naXRodWIuY29t
L2xpbnV4LWF1ZGl0L2F1ZGl0LWRvY3VtZW50YXRpb24vYmxvYi9tYWluL3NwZWNzL2ZpZWxkcy8K
PiA+ID4gZmllbGQtZGljdGlvbmFyeS5jc3YKPiA+ID4KPiA+ID4gRm9yIGV4YW1wbGUsIGRldiBp
cyBleHBlY3RlZCB0byBiZSAyIGhleCBudW1iZXJzIHNlcGFyYXRlZCBieSBhIGNvbG9uIHdoaWNo
Cj4gPiA+IGFyZSB0aGUgZGV2aWNlIG1ham9yIGFuZCBtaW5vciBudW1iZXJzLiBCdXQgZG93biBh
IGNvdXBsZSBsaW5lcyBmcm9tIGhlcmUsIHdlCj4gPiA+IGZpbmQgZGV2PSJ0bXBmcyIuIEJ1dCBp
c24ndCB0aGF0IGEgZmlsZXN5c3RlbSB0eXBlPwo+ID4KPiA+IFdoYXQgU3RldmUgc2FpZC4KPiA+
Cj4gPiBJJ2xsIGFsc28gYWRkIGFuIGFkbWluaXN0cmF0aXZlIG5vdGUsIHdlIGp1c3QgbW92ZWQg
dXBzdHJlYW0gTGludXgKPiA+IGF1ZGl0IGRldmVsb3BtZW50IHRvIGEgbmV3IG1haWxpbmcgbGlz
dCwgYXVkaXRAdmdlci5rZXJuZWwub3JnLCBwbGVhc2UKPiA+IHVzZSB0aGF0IGluIGZ1dHVyZSBw
YXRjaCBzdWJtaXNzaW9ucy4gIEFzIGEgcG9zaXRpdmUsIGl0J3MgYSBmdWxseQo+ID4gb3BlbiBs
aXN0IHNvIHlvdSB3b24ndCBydW4gaW50byBtb2RlcmF0aW9uIGRlbGF5cy9ub3RpZmljYXRpb25z
L2V0Yy4KPiA+Cj4gVGhhbmtzIGZvciB0aGUgaW5mbywgSSB3aWxsIHVwZGF0ZSB0aGUgYWRkcmVz
cy4KPgo+ID4gPiA+IFRoaXMgcGF0Y2ggYWxzbyBhZGRzIHN1cHBvcnQgZm9yIHN1Y2Nlc3MgYXVk
aXRpbmcsIGFsbG93aW5nIHVzZXJzIHRvCj4gPiA+ID4gaWRlbnRpZnkgaG93IGEgcmVzb3VyY2Ug
cGFzc2VkIHBvbGljeS4gSXQgaXMgcmVjb21tZW5kZWQgdG8gdXNlIHRoaXMKPiA+ID4gPiBvcHRp
b24gd2l0aCBjYXV0aW9uLCBhcyBpdCBpcyBxdWl0ZSBub2lzeS4KPiA+ID4gPgo+ID4gPiA+IFRo
aXMgcGF0Y2ggYWRkcyB0aGUgZm9sbG93aW5nIGF1ZGl0IHJlY29yZHM6Cj4gPiA+ID4KPiA+ID4g
PiAgIGF1ZGl0OiBBVURJVDE0MjAgcGF0aD0iL3RtcC90bXB3eG1hbTM2Ni9kZW55L2Jpbi9oZWxs
byIgZGV2PSJ0bXBmcyIKPiA+ID4gPiAgICAgaW5vPTcyIHJ1bGU9IkRFRkFVTFQgb3A9RVhFQ1VU
RSBhY3Rpb249REVOWSIKPiA+ID4KPiA+ID4gRG8gd2UgcmVhbGx5IG5lZWQgdG8gbG9nIHRoZSB3
aG9sZSBydWxlPwo+ID4KPiA+IEZhbiwgd291bGQgaXQgYmUgcmVhc29uYWJsZSB0byBsaXN0IHRo
ZSBwcm9wZXJ0aWVzIHdoaWNoIGNhdXNlZCB0aGUKPiA+IGFjY2VzcyBkZW5pYWw/ICBUaGF0IHNl
ZW1zIGxpa2UgaXQgbWlnaHQgYmUgbW9yZSBoZWxwZnVsIHRoYW4gdGhlCj4gPiBzcGVjaWZpYyBy
dWxlLCBvciBhbSBJIG1pc3Npbmcgc29tZXRoaW5nPwo+Cj4gQXVkaXQgdGhlIHdob2xlIHJ1bGUg
Y2FuIGxldCB0aGUgdXNlciBmaW5kIHRoZSByZWFzb24gb2YgYSBwb2xpY3kgZGVjaXNpb24uCj4g
V2UgbmVlZCB0aGUgd2hvbGUgcnVsZSBiZWNhdXNlIGFuIGFsbG93L2Jsb2NrIGlzIG5vdCBjYXVz
ZWQgYnkgYSBzcGVjaWZpYwo+IHByb3BlcnR5LCBidXQgdGhlIGNvbWJpbmF0aW9uIG9mIGFsbCBw
cm9wZXJ0eSBjb25kaXRpb25zIGluIGEgcnVsZS4KCk9rYXksIHRoYXQncyBhIHJlYXNvbmFibGUg
YXJndW1lbnQgZm9yIGxvZ2dpbmcgdGhlIHJ1bGUgYWxvbmcgd2l0aCB0aGUKZGVjaXNpb24uICBJ
IHRoaW5rIGl0IGhlbHBzIHRoYXQgdGhlIElQRSBwb2xpY3kgcnVsZXMgYXJlIG5vdApwYXJ0aWN1
bGFybHkgbG9uZy4KCj4gV2UgY291bGQgYWxzbyBhZGQgYSB2ZXJib3NlIHN3aXRjaCBzdWNoIHRo
YXQgd2Ugb25seSBhdWRpdAo+IHRoZSB3aG9sZSBydWxlIHdoZW4gYSB1c2VyIHR1cm5lZCB0aGUg
dmVyYm9zZSBzd2l0Y2ggb24uCgpJJ20gbm90IHN1cmUgdGhhdCdzIG5lY2Vzc2FyeSwgYW5kIGhv
bmVzdGx5IGl0IG1pZ2h0IGJlIGFubm95aW5nIGFzIHdlCndvdWxkIHN0aWxsIG5lZWQgdG8gb3V0
cHV0IGEgJ3J1bGU9Ij8iJyBmaWVsZCBpbiB0aGUgYXVkaXQgcmVjb3JkIGFzCml0IGlzIGNvbnNp
ZGVyZWQgZ29vZCBwcmFjdGljZSB0byBub3QgaGF2ZSBmaWVsZHMgbWFnaWNhbGx5IGFwcGVhciBh
bmQKZGlzYXBwZWFyIGZyb20gdGhlIHJlY29yZCBmb3JtYXQuICBIb3dldmVyLCBpZiB0aGVyZSBh
cmUgY29uY2VybnMKYWJvdXQgcmVjb3JkIHNpemVzLCB0aGF0IGNvdWxkIGJlIGEgcG90ZW50aWFs
IG1pdGlnYXRpb24uCgotLSAKcGF1bC1tb29yZS5jb20KCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcg
bGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQK

