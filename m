Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABB96C1A53
	for <lists+linux-audit@lfdr.de>; Mon, 20 Mar 2023 16:50:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679327453;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fEdxaL5vj6zaWTlT4m/UVed+ChHJWaOnEi18n5zUBmc=;
	b=GJt+QHqDp5mEiANiLcprlKjJ7yYgeoaI1WwggnB3P41DkfHeUkIMkFUFmE96tUuSxa2rgn
	cQ7CUYfeQa36Ip9LuMLtQBZSXmkuuMmZ5iIKuisMA4mjUggBiBChl2dh1NwKn5gaK8Zv51
	Vqbom+W+MZkB/hB8b+mVyn/741JQbZs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-Bx4OaC7qNcy1DukiP1c3Cg-1; Mon, 20 Mar 2023 11:50:47 -0400
X-MC-Unique: Bx4OaC7qNcy1DukiP1c3Cg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D174A8030D7;
	Mon, 20 Mar 2023 15:50:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 68F8F40C845F;
	Mon, 20 Mar 2023 15:50:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B931119465B6;
	Mon, 20 Mar 2023 15:50:40 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2FD6A1946594 for <linux-audit@listman.corp.redhat.com>;
 Mon, 20 Mar 2023 15:50:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 10D451121318; Mon, 20 Mar 2023 15:50:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 097091121315
 for <linux-audit@redhat.com>; Mon, 20 Mar 2023 15:50:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA88F3815F68
 for <linux-audit@redhat.com>; Mon, 20 Mar 2023 15:50:38 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-TfC7MzGcOpi7lLhiL5i1vg-1; Mon, 20 Mar 2023 11:50:35 -0400
X-MC-Unique: TfC7MzGcOpi7lLhiL5i1vg-1
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-544b959a971so197615907b3.3
 for <Linux-audit@redhat.com>; Mon, 20 Mar 2023 08:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679327434;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XhjG4ZM6bbphuME8qaGD16strmVMS/zUs25lWRzLtgA=;
 b=D8Eu6f8s0DC8EBQOXmAfczO2aQrCRfmet4AmOUvsqOjiaSwMKftskr4kpbzl/Oyo0V
 7nqcgNH/0aVpFgdAdqz9rQnJcCFAZeMB1Yx9q5bvOFTmGK8qVZOBGTBMhljD9UshVY86
 YLflRe79a7kmTQqCeElz6a3NPEytYoEn/9iwFJ17Y8Zv9tYFY4qJLOyX2tdPrihOSSKA
 p1aSsY8L26Zi4bVB/Ya/FxZSHG8nnZB0x1bWrB76Hdw6L8bGL9Gu0eRhpUOjezOkUOE+
 L5E+fG6804rxwE41uabO4GwePyV2/XovW2g/rXPNcv2h8qZ9mwsKIerRxhFlhmhdTNzC
 wg0A==
X-Gm-Message-State: AO0yUKWv5NS+cLADanqGwZmkE8fdEJ3QQSE/Ln+md8j/FxR+tdZWho4s
 YnUelwu0WEYwhQXDmh+H5quhJ7mnRiN3Gc0TH7pw
X-Google-Smtp-Source: AK7set8EHCVdzLcDk90+JtEnsZChSS0fog0skAl1a9UITDtzyJdC8DccLgmPj+vA2ozpkmyfwYaErzOdzIqRO9ANpzc=
X-Received: by 2002:a81:d302:0:b0:541:359c:103a with SMTP id
 y2-20020a81d302000000b00541359c103amr10221044ywi.8.1679327434420; Mon, 20 Mar
 2023 08:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAPoNrtsy+ckCHQZGYM-8DW3S3FckABGyZtvVG3LJPDT8PLzMUQ@mail.gmail.com>
 <CAHC9VhTPYw_YprXkZ2h-XAg3WGsqkTxBVzZiyo0XOaRmmeC71w@mail.gmail.com>
 <CAPoNrturZV58xESCvCOg5PQbHkf0reJvAbbLJ6-fJa003xxnjw@mail.gmail.com>
In-Reply-To: <CAPoNrturZV58xESCvCOg5PQbHkf0reJvAbbLJ6-fJa003xxnjw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 20 Mar 2023 11:50:23 -0400
Message-ID: <CAHC9VhSBbvE0GuLbrWmCgQyJc0KY_-MYrXYG08SjMp_7QYJnpg@mail.gmail.com>
Subject: Re: Help with setting up Auditd kernel repository
To: Anurag Aggarwal <anurag19aggarwal@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
Cc: audit@vger.kernel.org, Linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCBNYXIgMjAsIDIwMjMgYXQgMTE6MDnigK9BTSBBbnVyYWcgQWdnYXJ3YWwKPGFudXJh
ZzE5YWdnYXJ3YWxAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBDYW4geW91IGJlIG1vcmUgc3Bl
Y2lmaWMgYWJvdXQgdGhlIGV4YWN0IHJlcG9zaXRvcnk/ICBUaGVyZSBpcyBhCj4gPiByZXBvc2l0
b3J5IHdoaWNoIGNvbnRhaW5zIHRoZSBkZXZlbG9wbWVudCBjb2RlIGZvciB0aGUgTGludXggS2Vy
bmVsJ3MKPiA+IGF1ZGl0IHN1YnN5c3RlbSwgYW5kIHRoZXJlIGlzIGEgc2Vjb25kIHJlcG9zaXRv
cnkgd2hpY2ggY29udGFpbnMKPiA+IFN0ZXZlJ3MgYXVkaXQgdXNlcnNwYWNlIGNvZGUgKHdoaWNo
IGNvbnRhaW5zIGF1ZGl0ZCBhcyBhIGNvbXBvbmVudCkuCj4gPiBUaGVyZSBpcyBubyBjb21iaW5l
ZCAiYXVkaXRkLWtlcm5lbCIgcmVwb3NpdG9yeS4KPgo+IFllcyBQYXVsLCB0aGUgcmVwb3NpdG9y
eSB0aGF0IEkgYW0gdGFsa2luZyBhYm91dCBpczoKPiBodHRwczovL2dpdGh1Yi5jb20vbGludXgt
YXVkaXQvYXVkaXQta2VybmVsCgpbTk9URTogVGhlIHVwc3RyZWFtIExpbnV4IEtlcm5lbCBkaXNj
dXNzaW9uIGhhcyBtb3ZlZCB0bwphdWRpdEB2Z2VyLmtlcm5lbC5vcmcsIENDJ2Qgb24gdGhpcyBl
bWFpbF0KClRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24uCgpJZiB5b3UgYXJlbid0IGFscmVh
ZHkgYXdhcmUgb2YgdGhlIEtlcm5lbCBOZXdiaWVzIHNpdGUsIGl0J3MgYSBnb29kCnJlc291cmNl
IGZvciBnZXR0aW5nIGZhbWlsaWFyIHdpdGggdGhlIExpbnV4IEtlcm5lbC4gIFRoZXJlIGFyZSBh
CmNvdXBsZSBvZiBwYWdlcyB3aGljaCBJIGJlbGlldmUgbWlnaHQgYmUgaGVscGZ1bCBoZXJlLCB0
aGUgZmlyc3QgaXMKdGhlIGd1aWRlIG9uIGJ1aWxkaW5nIHRoZSBMaW51eCBLZXJuZWw6CgoqIGh0
dHBzOi8va2VybmVsbmV3Ymllcy5vcmcvS2VybmVsQnVpbGQKCi4uLiB0aGUgc2Vjb25kIHBhZ2Ug
aXMgYSBnZW5lcmFsIGxhbmRpbmcgcGFnZSB3aGljaCBoYXMgbGlua3MgdG8gb3RoZXIKa2VybmVs
IHJlbGF0ZWQgZ3VpZGVzIGFuZCByZXNvdXJjZXM6CgoqIGh0dHBzOi8va2VybmVsbmV3Ymllcy5v
cmcvS2VybmVsSGFja2luZwoKVGhlc2UgaW5mbyBvbiB0aGVzZSBwYWdlcyBzaG91bGQgaGVscCB5
b3UgZ2V0IHN0YXJ0ZWQgYnV0IGlmIHlvdSBoYXZlCmFueSBhZGRpdGlvbmFsIHF1ZXN0aW9ucyBs
ZXQgdXMga25vdy4KCi0tIApwYXVsLW1vb3JlLmNvbQoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBs
aXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1hdWRpdAo=

