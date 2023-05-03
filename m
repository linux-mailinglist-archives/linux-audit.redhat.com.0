Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C0E6F6086
	for <lists+linux-audit@lfdr.de>; Wed,  3 May 2023 23:27:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683149254;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zERvm8m4UMjTDDc5s07MrYk5yh9/2arKLrZS3c62okY=;
	b=FeyKphdNgSVG6ISoYG745n7yI/LM98VJGMkZ+7NOZ56xwUNvxdWypp25Jy7FJMujWMqlre
	oOJ4ZZKGO4Wk7ZGyuZoecbU9kUugswUzH2hd/rbCyzh2d5JS/pttoLkTw5SAtYatMwFkHo
	w2glDTplbTRAzVNhs1bjL3MxjV5n/Zw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-7ZE87qRaMbS429416HjjIw-1; Wed, 03 May 2023 17:27:30 -0400
X-MC-Unique: 7ZE87qRaMbS429416HjjIw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7B831C06900;
	Wed,  3 May 2023 21:27:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 15CEC2166B26;
	Wed,  3 May 2023 21:27:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8D4691946A43;
	Wed,  3 May 2023 21:27:27 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5E3D919465BB for <linux-audit@listman.corp.redhat.com>;
 Wed,  3 May 2023 21:27:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2C794C15BAE; Wed,  3 May 2023 21:27:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24F26C15BAD
 for <linux-audit@redhat.com>; Wed,  3 May 2023 21:27:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AE8D800B35
 for <linux-audit@redhat.com>; Wed,  3 May 2023 21:27:26 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-RrIDzdjrPHSpqhK2Mbk6vw-1; Wed, 03 May 2023 17:27:24 -0400
X-MC-Unique: RrIDzdjrPHSpqhK2Mbk6vw-1
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-b9a6eec8611so5822090276.0
 for <linux-audit@redhat.com>; Wed, 03 May 2023 14:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683149243; x=1685741243;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yKn+jrgf5ZZ4kjsMO+s/G7W8oD90MsZ6Rc9QWtHf4+c=;
 b=UWDSNK0lj43gdfirDX+pcJCisq4LMjHhgqLhBuxxvHkV36dRiyI+sEmRzBnBLlV62A
 w6QDsF0tBxzWW22Yq30BkUt2Vk7X/3kLPKkLmihICXlj/qkiVhjQjoea7k8iZbbTjjUC
 zqOY9ASY5fUzeDHo3j6Rl154ywGkvhvbEgWyXcaZRQK0nqbNVMeQRzRyP3LtKMC02mok
 EPM08Jk8qSQwS7sFZeoJHzIDZo1JCSp+jkeIwVf5VFterMDcE+Aw2RXbNVtW82r0qPAc
 5iYeJd8Hj34vZdj0aB/KlSKHWr6kWuAXQoPv1mIuMlJOj+Zwa2+biMDTZipInBZrQKNX
 4uzA==
X-Gm-Message-State: AC+VfDypkE9PqD0PbcMUYUg/qCHDFIASVByK3NOmapAxF1/5IYKXZotZ
 7+qNz+HHK3jV1KqRYRA9fQGg+2d/yL+udI1ejAjf
X-Google-Smtp-Source: ACHHUZ5Au2ecBwsk2/a2XW6nh7EbkJUnX+5vYeJ4vdHMe0++N7uH9a+Afe24IcmFTNIykkzGU7atqXctsrSTKpNbUq0=
X-Received: by 2002:a81:505:0:b0:55a:5323:2801 with SMTP id
 5-20020a810505000000b0055a53232801mr3600764ywf.23.1683149243701; Wed, 03 May
 2023 14:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <ecd4bf68-3bf1-a1d8-4da5-5fbd28c51a6b@gmail.com>
In-Reply-To: <ecd4bf68-3bf1-a1d8-4da5-5fbd28c51a6b@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 3 May 2023 17:27:13 -0400
Message-ID: <CAHC9VhTXHLS7bsDJ8-dSp4dQSQRcKRLiTMRYJOJVCY11G5D85A@mail.gmail.com>
Subject: Re: Can AUDIT_LIST_RULES causes kthreadd-spam?
To: Rinat Gadelshin <rgadelsh@gmail.com>
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
Cc: audit@vger.kernel.org, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBNYXkgMywgMjAyMyBhdCA1OjE04oCvUE0gUmluYXQgR2FkZWxzaGluIDxyZ2FkZWxz
aEBnbWFpbC5jb20+IHdyb3RlOgo+IEhlbGxvIHRoZXJlID0pCj4KPiBNeSBuYW1lIGlzIFJpbmF0
Lgo+IEknbSBhIG5ld2JpZSBoZXJlIChhdCBMaW51eCBrZXJuZWwgZGV2ZWxvcGVyIGNvbW11bml0
eSkuCj4KPiBNeSBjdXJyZW50IGpvYiBpcyB0byB3b3JrIHdpdGggYXVkaXQgc3Vic3lzdGVtIG9u
IGRpZmZlcmVudAo+IHZlcnNpb25zIG9mIExpbnV4IChhbmQgZGlmZmVyZW50IGtlcm5lbCB2ZXJz
aW9ucyBmcm9tIDMuMTAgdG8gdGhlIGxhdGVzdCkKPiB3aXRoIGFuZCB3aXRob3V0IGF1ZGl0ZC4K
Pgo+IE15IHByb2dyYW0gd29ya3MgYmVoYWxmIG9mIHJvb3QgYWNjb3VudCBhbmQgdXNlcyBuZXRs
aW5rCj4gKHVuaWNhc3Qgb3IgbXVsdGljYXN0IGRlcGVuZHMgb2YgIHRoZSBrZXJuZWwncyB2ZXJz
aW9uKQo+IHRvIGNvbW11bmljYXRlIHdpdGggYXVkaXQgc3Vic3lzdGVtIG9mIHRoZSBrZXJuZWwu
Cj4KPiBJZiBhY3R1YWwgYXVkaXQgcnVsZSBsaXN0IGhhcyBiZWVuIGNoYW5nZWQKPiB0aGVuIG15
IHByb2dyYW0gc2hvdWxkIHJlc3RvcmUgdGhlIGNvbmZpZ3VyZWQgYXVkaXQgcnVsZSBsaXN0Lgo+
Cj4gVG8gZG8gaXQgdGhlIHByb2dyYW0gcGVyaW9kaWNhbGx5ICh3aXRoIDYwIHNlY29uZHMgaW50
ZXJ2YWwpCj4gcmVxdWVzdHMgdGhlIGFjdHVhbCBydWxlIGxpc3QgYmUgc2VuZGluZyBBVURJVF9M
SVNUX1JVTEVTLgo+Cj4gQWxsIHJ1bGVzIGFyZSByZWNlaXZpbmcgcGVyZmVjdGx5Lgo+Cj4gQnV0
IEkndmUgbm90aWNlZCB0aGF0IHRoZXJlIGFyZSBtYW55ICgySysgZm9yIDUgbWludXRlcyB0ZXN0
KQo+IGt0aHJlYWRkIHByb2Nlc3MgaGF2ZSBiZWVuIHNwYXduZWQgYWZ0ZXIgdGhhdCByZXF1ZXN0
Cj4gKEkndmUgc3R1YmJlZCB0aGUgcG9sbCBjb2RlIGFuZCBjb21wYXJlIGxvZ3MpLgoKSGkgUmlu
YXQsCgpGaXJzdCwgYSBxdWljayBub3RlIHRoYXQgYXVkaXQgZGlzY3Vzc2lvbnMgaW52b2x2aW5n
IHRoZSB1cHN0cmVhbQpMaW51eCBLZXJuZWwgaGF2ZSBtb3ZlZCB0byB0aGUgYXVkaXRAdmdlci5r
ZXJuZWwub3JnIGxpc3QgKENDJ2QpLApwbGVhc2UgZGlyZWN0IGZ1dHVyZSBlbWFpbHMgdGhlcmUu
CgpDYW4geW91IGJlIG1vcmUgc3BlY2lmaWMgYWJvdXQgdGhlIGtlcm5lbCB0aHJlYWRzIHlvdSBh
cmUgc2VlaW5nLCBhcmUKeW91IHNlZWluZyBtdWx0aXBsZSAia2F1ZGl0ZCIgdGhyZWFkcz8KCiUg
cHMgLWZDIGthdWRpdGQKVUlEICAgICAgICAgIFBJRCAgICBQUElEICBDIFNUSU1FIFRUWSAgICAg
ICAgICBUSU1FIENNRApyb290ICAgICAgICAgIDg5ICAgICAgIDIgIDAgQXByMjggPyAgICAgICAg
MDA6MDA6MDAgW2thdWRpdGRdCgo+IFBsZWFzZSwgY2FuIHlvdSBwb2ludCBtZSwgd2hhdCBjYW4g
SSBkbyB0byBhdm9pZCB0aGlzIGt0aHJlYWRkLXNwYW0uCj4KPiBUaGFuayB5b3UuCj4KPiBCZXN0
IHJlZ2FyZHMKPiBSaW5hdGgKCi0tIApwYXVsLW1vb3JlLmNvbQoKLS0KTGludXgtYXVkaXQgbWFp
bGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdAo=

