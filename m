Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 811EE6B19FF
	for <lists+linux-audit@lfdr.de>; Thu,  9 Mar 2023 04:34:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678332890;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Dd1thwnwdNuzqW8ZaXmwqoP8GfH3XqYQ1aPIPYbzNus=;
	b=e4RFQaTVd8MAGQ1XrxObhycffK+HsfQ9qN3dVCTX+kuHHdH/qQqJR6E2zXsm4FOJARF67P
	fzosVjVG+KPx9qE2W/PwXtSM6Igedo4t6+/ULyTGl0iUbIapEQ8BeUKflnkZPU6IMnIBg/
	gZrrRHz2odSQpPVTGnkRHmwxtq/Mr+g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-swtt5fGDMruNJWBeun8Kqg-1; Wed, 08 Mar 2023 22:34:49 -0500
X-MC-Unique: swtt5fGDMruNJWBeun8Kqg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29B6E1C3D385;
	Thu,  9 Mar 2023 03:34:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 226E91121314;
	Thu,  9 Mar 2023 03:34:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BF5D11946A4C;
	Thu,  9 Mar 2023 03:34:41 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 57B9D19465B5 for <linux-audit@listman.corp.redhat.com>;
 Thu,  9 Mar 2023 03:34:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 39D43C15BAD; Thu,  9 Mar 2023 03:34:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31AEDC15BA0
 for <linux-audit@redhat.com>; Thu,  9 Mar 2023 03:34:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1559385D062
 for <linux-audit@redhat.com>; Thu,  9 Mar 2023 03:34:40 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-v2MV3OoNMAKlF2GBxsE9Cg-1; Wed, 08 Mar 2023 22:34:38 -0500
X-MC-Unique: v2MV3OoNMAKlF2GBxsE9Cg-1
Received: by mail-pg1-f174.google.com with SMTP id bn17so276753pgb.10
 for <linux-audit@redhat.com>; Wed, 08 Mar 2023 19:34:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678332877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UtyFy5lK546m1Ko9AU2dbEmxXDKIVlkVO8zumBpv+iQ=;
 b=wH+TBh8ZqHQREemG7jxmZA9ardjxaNc02/Wfj7vgkcbMDHhzG2dTGq5VWu5jwAj9G+
 3qphAQhX7nzi26GSavc1hhzDuOf0v72cj3TuGES2X03cl3dlzHoc6vagZoIwDa2j7nyL
 kAede+1b+H6QMH0RoKAYXSPBqRvZtVqmf6BiDCPEysvmvxtd2FE6icAcBalovO67EOPt
 xzyqIzlUuBKOU1t3YO6+TcNbYpNnzQe4BczUU6yesvkpxy99y1G05e8aeBmpxi5Thdop
 ib/pDlymmI/xcvFQbPTy5qINPlSafFWzRzyXYOLHp2MrOVlFptfo3UUknzIPXhoLpScB
 iEVg==
X-Gm-Message-State: AO0yUKX4I+se2p33oDwWGYEF5sywX1rF4HZuGR0i4GMayGaxrAv2YLTL
 pUCsl+mZ8WVUYTR/SJ36Yw3PYQLddY2ZFj9jG2Pc/FXDVzahIuk=
X-Google-Smtp-Source: AK7set8JtluS4NB5Eg1nM2wb6wibRNAZwuZRjiPjwE/cNpoT9SqYQ2WSfcxZNo7JZe8lnN7eHOujeLXD3CLmUYgzIss=
X-Received: by 2002:a63:fd41:0:b0:503:a7:c934 with SMTP id
 m1-20020a63fd41000000b0050300a7c934mr8143647pgj.2.1678332876602; 
 Wed, 08 Mar 2023 19:34:36 -0800 (PST)
MIME-Version: 1.0
References: <CAH6unQK=a54uxPjvdgNrZy57cHwZKw72rJMNeDRxAch8q46dcQ@mail.gmail.com>
In-Reply-To: <CAH6unQK=a54uxPjvdgNrZy57cHwZKw72rJMNeDRxAch8q46dcQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 8 Mar 2023 22:34:25 -0500
Message-ID: <CAHC9VhR-51mMWvrdU3AJsBi7RRiKE49rQV+PX6cifT5P=r3pqA@mail.gmail.com>
Subject: Re: Auditing nftables changes
To: Bruce Elrick <bruce.elrick@canonical.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBNYXIgOCwgMjAyMyBhdCA3OjEz4oCvUE0gQnJ1Y2UgRWxyaWNrIDxicnVjZS5lbHJp
Y2tAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4gSGVsbG8gYWxsLAo+Cj4gSSdtIG5vdCBzdXJlIGlm
IHRoaXMgbGlzdCBpcyBhcHByb3ByaWF0ZSBmb3IgcXVlc3Rpb25zIHNvIHBsZWFzZSBsZXQKPiBt
ZSBrbm93IGFuZCBvdGhlcndpc2UgaWdub3JlIGlmIHRoaXMgbWVzc2FnZSBpcyBub3QgYXBwcm9w
cmlhdGUuCj4KPiBJJ20gdHJ5aW5nIHRvIGhlbHAgc29tZW9uZSB3aG8gaXMgZmluYWxseSBtaWdy
YXRpbmcgZnJvbSBpcHRhYmxlcyB0bwo+IG5mdGFibGVzIG9uIHRoZSBiYWNrLWVuZCBhbmQgbmVl
ZHMgdG8gdGhlcmVmb3JlIG1pZ3JhdGUgdGhlaXIgYXVkaXQKPiBjYXBhYmlsaXR5Lgo+Cj4gQ3Vy
cmVudGx5IHRoZXkgaGF2ZSBhIHNpbmdsZSBzaW1wbGUgYXVkaXQgcnVsZSB0byBkZXRlY3Qgd2hl
biB0aGVyZSBpcwo+IGEgaXB0YWJsZSBjaGFuZ2UgZnJvbSBhbnkgYXVkaXQgdXNlciBhcGFydCBm
cm9tIHRoZWlyIHNlcnZpY2UgdXNlcgo+IHVzaW5nIGEgcnVsZSBsaWtlIHRoZSBhY2NlcHRlZCBh
bnN3ZXIgZ2l2ZW4gaW4gdGhpc1swXSBTdGFja0V4Y2hhbmdlCj4gcXVlc3Rpb24sIGFsdGhvdWdo
IHdpdGggYWRkZWQgZmlsdGVycyBvbiB0aGUgYXVpZCAoSSBoYXZlIHRvIGFkbWl0IEkKPiBkb24n
dCBrbm93IHRoZSBvcmlnaW4gb2YgYXVpZD0tMSBldmVudHMpOgo+Cj4gICAgIGF1ZGl0Y3RsIC1h
IGV4aXQsYWx3YXlzIC1GIGFyY2g9YjY0IC1GIGEyPTY0IC1GIGF1aWQhPS0xIC1GCj4gYXVpZCE9
JHtzZXJ2aWNldXNlcl91aWR9IC1TIHNldHNvY2tvcHQgLWsgaXB0YWJsZXNDaGFuZ2UKPgo+IFRo
ZXkgYXJlIG1pZ3JhdGluZyBmcm9tIFVidW50dSBiaW9uaWMgdG8gamFtbXkgYW5kIHN0aWxsIHVz
aW5nIHRoZQo+IGlwdGFibGVzIGZyb250LWVuZCBidXQgc2luY2UgdGhlIGJhY2stZW5kIGNoYW5n
ZXMgZnJvbSBkZWZhdWx0Cj4gaXB0YWJsZXMgdG8gZGVmYXVsdCBuZnRhYmxlcyB0aGV5IG5lZWQg
dG8gY2hhbmdlIHRoZWlyIGF1ZGl0IHJ1bGVzCj4KPiBUaGV5IGRpZCBzdHJhY2UgdGVzdGluZyBh
bmQgbm90ZWQgdGhlIHN5c2NhbGwgY2hhbmdpbmcgZnJvbQo+Cj4gICAgIHNldHNvY2tvcHQoNCwg
U09MX0lQLCBJUFRfU09fU0VUX1JFUExBQ0UsCj4gImZpbHRlclwwXDBcMFwwXDBcMFwwXDBcMFww
XDBcMFwwXDBcMFwwXDBcMFwwXDBcMFwwXDBcMFwwXDAiLi4uLAo+IDgwOTUyKSA9IDAKPgo+IHRv
Cj4KPiAgICAgc2VuZHRvKDMsIFt7bmxtc2dfbGVuPTIwLAo+IG5sbXNnX3R5cGU9TkZOTF9TVUJT
WVNfTkZUQUJMRVM8PDh8TkZUX01TR19HRVRHRU4sCj4gbmxtc2dfZmxhZ3M9TkxNX0ZfUkVRVUVT
VCwgbmxtc2dfc2VxPTAsIG5sbXNnX3BpZD0wfSwKPiB7bmZnZW5fZmFtaWx5PUFGX1VOU1BFQywg
dmVyc2lvbj1ORk5FVExJTktfVjAsIHJlc19pZD1odG9ucygwKX1dLCAyMCwKPiAwLCB7c2FfZmFt
aWx5PUFGX05FVExJTkssIG5sX3BpZD0wLCBubF9ncm91cHM9MDAwMDAwMDB9LCAxMikgPSAyMAo+
Cj4gYmV0d2VlbiB0aGUgdHdvIHZlcnNpb25zLgo+Cj4gSW4gbXkgb3duIHRlc3RpbmcsIEkgZGVj
aWRlZCB0byBhcHByb2FjaCBmcm9tIHRoZSBhdWRpdCB0b29scwo+IHBlcnNwZWN0aXZlIHNvIEkg
Y3JlYXRlZCBhIGJyb2FkIHJ1bGUgdG8gY2FwdHVyZSBhbGwgc3lzdGVtIGNhbGwKPiByZWxhdGVk
IHRvIGEgdGVzdCB1c2VyOgo+Cj4gICAgIGF1ZGl0Y3RsIC1hIGFsd2F5cyxleGl0IC1TIGFsbCAt
RiBhdWlkPTEwMDEgIyAxMDAxIGlzIHVpZCBvZiB0ZXN0dXNlcgo+Cj4gVGhlbiBJIHRyaWVkIHZh
cmlvdXMgb3BlcmF0aW9ucyB1c2luZyBteSB0ZXN0dXNlciBzdWNoIGFzCj4gaXB0YWJsZXMtcmVz
dG9yZSBvZiBlaXRoZXIgYSBkZWZhdWx0LWFjY2VwdCBydWxlIHNldCB3aXRoIG5vIHJ1bGVzIG9y
Cj4gd2l0aCBvbmUgb3IgdHdvIHNpbXBsZSBkcm9wIHJ1bGVzLiBJIGFsc28gdGVzdGVkIGFkZGlu
ZyBqdXN0IGEgc2luZ2xlCj4gaXB0YWJsZXMgcnVsZS4gSSB0aGVuIHVzZWQgYXVzZWFyY2ggdG8g
ZGlzY292ZXIgd2hhdCB0aGUgYXVkaXQgc3lzdGVtCj4gY2FwdHVyZWQ6Cj4KPiAgICAgIyBhdXNl
YXJjaCAtaSAtbSBORVRGSUxURVJfQ0ZHCj4gICAgIC4uLgo+ICAgICAtLS0tCj4gICAgIHR5cGU9
UFJPQ1RJVExFIG1zZz1hdWRpdCgwMy8wNy8yMDIzIDE3OjE4OjU1LjE1MjoxNDMwNDQpIDoKPiBw
cm9jdGl0bGU9aXB0YWJsZXMtcmVzdG9yZQo+ICAgICB0eXBlPVNZU0NBTEwgbXNnPWF1ZGl0KDAz
LzA3LzIwMjMgMTc6MTg6NTUuMTUyOjE0MzA0NCkgOgo+IGFyY2g9eDg2XzY0IHN5c2NhbGw9c2Vu
ZG1zZyBzdWNjZXNzPXllcyBleGl0PTc2NCBhMD0weDMKPiBhMT0weDdmZmRiMGU5OGRiMCBhMj0w
eDAgYTM9MHg3ZmZkYjBlOThkOWMgaXRlbXM9MCBwcGlkPTU2NzMgcGlkPTU2NzYKPiBhdWlkPXRl
c3R1c2VyIHVpZD1yb290IGdpZD1yb290IGV1aWQ9cm9vdCBzdWlkPXJvb3QgZnN1aWQ9cm9vdAo+
IGVnaWQ9cm9vdCBzZ2lkPXJvb3QgZnNnaWQ9cm9vdCB0dHk9cHRzMiBzZXM9MTA4IGNvbW09aXB0
YWJsZXMtcmVzdG9yCj4gZXhlPS91c3Ivc2Jpbi94dGFibGVzLW5mdC1tdWx0aSBzdWJqPXVuY29u
ZmluZWQga2V5PShudWxsKQo+ICAgICB0eXBlPU5FVEZJTFRFUl9DRkcgbXNnPWF1ZGl0KDAzLzA3
LzIwMjMgMTc6MTg6NTUuMTUyOjE0MzA0NCkgOgo+IHRhYmxlPWZpbHRlcjozMCBmYW1pbHk9aXB2
NCBlbnRyaWVzPTEyIG9wPW5mdF91bnJlZ2lzdGVyX3RhYmxlCj4gcGlkPTU2NzYgc3Viaj11bmNv
bmZpbmVkIGNvbW09aXB0YWJsZXMtcmVzdG9yCj4gICAgIHR5cGU9TkVURklMVEVSX0NGRyBtc2c9
YXVkaXQoMDMvMDcvMjAyMyAxNzoxODo1NS4xNTI6MTQzMDQ0KSA6Cj4gdGFibGU9ZmlsdGVyOjMw
IGZhbWlseT1pcHY0IGVudHJpZXM9NyBvcD1uZnRfcmVnaXN0ZXJfY2hhaW4gcGlkPTU2NzYKPiBz
dWJqPXVuY29uZmluZWQgY29tbT1pcHRhYmxlcy1yZXN0b3IKPiAgICAgLS0tLQo+ICAgICB0eXBl
PVBST0NUSVRMRSBtc2c9YXVkaXQoMDMvMDcvMjAyMyAxNzoyMzowNC4zOTA6MTQ0NDU5KSA6Cj4g
cHJvY3RpdGxlPXN1ZG8gL3Vzci9zYmluL2lwdGFibGVzIC1BIE9VVFBVVCAtZCAxMC4xMDAuMjQ5
LjY0IC1qIERST1AKPiAgICAgdHlwZT1TT0NLQUREUiBtc2c9YXVkaXQoMDMvMDcvMjAyMyAxNzoy
MzowNC4zOTA6MTQ0NDU5KSA6IHNhZGRyPXsKPiBzYWRkcl9mYW09bmV0bGluayBubG5rLWZhbT0x
NiBubG5rLXBpZD0wIH0KPiAgICAgdHlwZT1TWVNDQUxMIG1zZz1hdWRpdCgwMy8wNy8yMDIzIDE3
OjIzOjA0LjM5MDoxNDQ0NTkpIDoKPiBhcmNoPXg4Nl82NCBzeXNjYWxsPXNlbmRtc2cgc3VjY2Vz
cz15ZXMgZXhpdD0zMDQgYTA9MHgzCj4gYTE9MHg3ZmZjODA2NTkxMTAgYTI9MHgwIGEzPTB4N2Zm
YzgwNjU5MGZjIGl0ZW1zPTAgcHBpZD01NzAzIHBpZD01NzA0Cj4gYXVpZD10ZXN0dXNlciB1aWQ9
cm9vdCBnaWQ9cm9vdCBldWlkPXJvb3Qgc3VpZD1yb290IGZzdWlkPXJvb3QKPiBlZ2lkPXJvb3Qg
c2dpZD1yb290IGZzZ2lkPXJvb3QgdHR5PXB0czIgc2VzPTEwOCBjb21tPWlwdGFibGVzCj4gZXhl
PS91c3Ivc2Jpbi94dGFibGVzLW5mdC1tdWx0aSBzdWJqPXVuY29uZmluZWQga2V5PShudWxsKQo+
ICAgICB0eXBlPU5FVEZJTFRFUl9DRkcgbXNnPWF1ZGl0KDAzLzA3LzIwMjMgMTc6MjM6MDQuMzkw
OjE0NDQ1OSkgOgo+IHRhYmxlPWZpbHRlcjozMSBmYW1pbHk9aXB2NCBlbnRyaWVzPTEgb3A9bmZ0
X3JlZ2lzdGVyX3J1bGUgcGlkPTU3MDQKPiBzdWJqPXVuY29uZmluZWQgY29tbT1pcHRhYmxlcwo+
Cj4gVGhlIGV2ZW50IHNlcXVlbmNlcyBzZWVtIHRvIG1ha2Ugc2Vuc2Ugd2l0aCB0aGUgc29ja2Fk
ZHIgZnVuY3Rpb24KPiBzZWxlY3RpbmcgdGhlIG5ldGxpbmsgZmFtaWx5IHdoaWNoIGFncmVlcyB3
aXRoIHRoZSBzdHJhY2Ugb3V0cHV0Lgo+Cj4gV2l0aCB0aGUgY2hhbmdlIGluIHRoZSBiYWNrLWVu
ZCB0byBuZnRhYmxlcywgSSBjYW4gc2VlIGluIGVpdGhlciBjYXNlCj4gdGhhdCB0aGUgc2V0c29j
a29wdCBzeXN0ZW0gY2FsbCB3aXRoIGEgbmljZSwgY3Jpc3AsIHNpbmdsZSBhcmd1bWVudAo+IChh
Mj02NC9JUFRfU09fU0VUX1JFUExBQ0UpIG9wdGlvbiB3aXRoIGVpdGhlciBhIHNlbmR0byBvciBz
ZW5kbXNnCj4gc3lzdGVtIGNhbGwgYnV0IHdpdGggYSBwb2ludGVyIHRvIGEgbWVzc2FnZSBzdHJ1
Y3R1cmUuIEkgcmVhZCB0aGF0Cj4gYXVkaXQgcnVsZXMgY2Fubm90IGZpbHRlciB1c2luZyBkYXRh
IGluc2lkZSBzdHJ1Y3QgYXJndW1lbnRzLgo+Cj4gTXkgbmFpdmUgaW50ZXJwcmV0YXRpb24gb2Yg
dGhpcyBpcyB0aGF0IEknZCBuZWVkIHRvIGhhdmUgYSBydWxlIHRoYXQKPiBjYXB0dXJlcyBhbGwg
c2VuZG1zZyBzeXNjYWxscyB3aXRoIChhdWlkIT0tMSBhbmQKPiBhdWlkIT0ke3NlcnZpY2V1c2Vy
X3VpZH0gYnV0IEkgZG9uJ3Qga25vdyBlbm91Z2ggYWJvdXQgc29ja2V0IHN5c2NhbGwKPiB1c2Fn
ZSB0byBrbm93IHdoZXRoZXIgdGhpcyBpcyB0b28gbXVjaC4gSSBzZWUgdGhhdCB3cml0ZSgyKSB0
byBhCj4gc29ja2V0IGlzIHRoZSBzYW1lIGFzIHNlbmQoMikgd2l0aG91dCB0aGUgZmxhZ3Mgc28g
SSBtaWdodCBhc3N1bWUgdGhhdAo+IG1vc3Qgc29ja2V0IHN5c2NhbGxzIHRoYXQgYXJlIHNlbmRp
bmcgZGF0YSB1c2Ugd3JpdGUoMikgYW5kIG5vdAo+IHNlbmQvc2VuZHRvL3NlbmRtc2coMikgYnV0
IEkgd29ycnkgdGhpcyB3b3VsZCBiZSB0b28gbXVjaCBhdWRpdCBkYXRhLgo+Cj4gQW55b25lIGNh
cmUgdG8gY29tbWVudCBvciBwb2ludCBtZSBpbiB0aGUgY29ycmVjdCBkaXJlY3Rpb24/CgpUaGUg
cHJvYmxlbSBJIHRoaW5rIHlvdSdyZSBnb2luZyB0byBoYXZlLCBhbmQgSSBiZWxpZXZlIHlvdSd2
ZSBhbHJlYWR5CnN1c3BlY3RlZCBpdCwgaXMgdGhhdCBhdWRpdGluZyBzb2NrZXQgd3JpdGVzIGlz
IGdvaW5nIHRvIHJlc3VsdCBpbiBhCmZpcmVob3NlIG9mIHJlY29yZHMuICBIb3dldmVyLCB1bmxl
c3MgeW91IGhhdmUgYW4gZXhjbHVkZSBmaWx0ZXIgZm9yCk5FVEZJTFRFUl9DRkcgcmVjb3JkcyBJ
IGJlbGlldmUgdGhleSB3aWxsIGJlIGdlbmVyYXRlZCB3aXRob3V0IGFuCmV4cGxpY2l0IGZpbHRl
ciBydWxlIHRyaWdnZXJpbmcgdGhlaXIgZ2VuZXJhdGlvbi4KCk9yIGFtIEkgbWlzdW5kZXJzdGFu
ZGluZyB5b3VyIHF1ZXN0aW9uPwoKLS0gCnBhdWwtbW9vcmUuY29tCgotLQpMaW51eC1hdWRpdCBt
YWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==

