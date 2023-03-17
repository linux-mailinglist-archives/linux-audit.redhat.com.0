Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFBE6BF2C2
	for <lists+linux-audit@lfdr.de>; Fri, 17 Mar 2023 21:38:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679085490;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WPXPLakd6JZ5cGy9UDcpauzVTVRQO/ZZmb+4GQysw1w=;
	b=YFBc3NEWKMh49E3RYGAyX6exEGyFggvMq3kW6XBEGAIG4FX7/6BSBWMiaMF+1u63NSbCHh
	6wMxY3xD01p+37rldd+5p6gOdMnkDEiK6YHaoprbkzCpPg+807jAVe2T6k2ME4oKtUdNMO
	rSB7wzeXM2OP1EKk4oMWfu4vCzQhLmk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-BNFt8pQvNZWQuNseZN0i-Q-1; Fri, 17 Mar 2023 16:38:06 -0400
X-MC-Unique: BNFt8pQvNZWQuNseZN0i-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49A56185A790;
	Fri, 17 Mar 2023 20:38:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1204E2027064;
	Fri, 17 Mar 2023 20:38:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E7E001946A50;
	Fri, 17 Mar 2023 20:37:53 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ECF4519466DF for <linux-audit@listman.corp.redhat.com>;
 Fri, 17 Mar 2023 20:37:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A31B61121318; Fri, 17 Mar 2023 20:37:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C1611121315
 for <linux-audit@redhat.com>; Fri, 17 Mar 2023 20:37:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 625731C05134
 for <linux-audit@redhat.com>; Fri, 17 Mar 2023 20:37:51 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-ZX1xPgkEPeKSDtfM4WfveA-1; Fri, 17 Mar 2023 16:37:49 -0400
X-MC-Unique: ZX1xPgkEPeKSDtfM4WfveA-1
Received: by mail-yb1-f176.google.com with SMTP id z83so7087899ybb.2
 for <linux-audit@redhat.com>; Fri, 17 Mar 2023 13:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679085469;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v5YPquWTXwq4ftGZFMkxuswI+Et8fgMbMriG2VU/zy0=;
 b=Z+SrYA/nPKM5GUs3P1XXp6vznuUfKcLPUaJJe3mBhRxOmkymuFAimzhmR+TjFH/LZb
 2t4+ShFnmVIBeuXZPedJaW59qlZ1z1sYv07xk2lXmBiW8/0DBOz9hx7jrVwnrLVWkdkb
 n1VaedRD/iCKE+1NNfr/7iKUrqLdqYABZkqPQ5FbfvrdolK0jzF1r9qXDjr4GLH4GJRB
 gS9LlS8u+wUuCRX9mSMbuoZLPacuZUaVbzwWs1GXu77cilm18ayUBNfRpvEGOujUU13A
 i4qQdPIyLUrkxTCXKwThe9MvAy/kb+ZR3XtFUr1avVotG/TybT6BSnZgmUPcDXE+PLYU
 jUaA==
X-Gm-Message-State: AO0yUKVES2gfmgAjIuQM0nM5Mg/ijWHeHQ7F9bPPa6mVjDa94dZktk1C
 d3pv9f+mMO+3S4G4hJDRLbilDfH17uaqw9M/UJwfcIW9Z8z5K4Tdhw==
X-Google-Smtp-Source: AK7set9LDi+rZ9oIzM6E6XXXBiyVEJ5aFJ+JTdodl+F57ab4aB39CYyXrbJhtRBZntk4VdA7FoJ09x9U78FabcgO54k=
X-Received: by 2002:a05:6902:1082:b0:a06:55b5:3cdf with SMTP id
 v2-20020a056902108200b00a0655b53cdfmr539449ybu.3.1679085468955; Fri, 17 Mar
 2023 13:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAHC9VhRMJq1gJPoR79AxM1JphmGtxhGMYBkd=Ptuaq3WBjX2Bw@mail.gmail.com>
 <12213468.O9o76ZdvQC@x2>
In-Reply-To: <12213468.O9o76ZdvQC@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 17 Mar 2023 16:37:38 -0400
Message-ID: <CAHC9VhSEM50nMmK+uEUjwmYM_6-pkp8k4=-MXBLLHCJy+FcHyw@mail.gmail.com>
Subject: Re: audit userspace problems with io_uring async ops
To: Steve Grubb <sgrubb@redhat.com>, linux-audit@redhat.com
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
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBNYXIgNywgMjAyMyBhdCA0OjE34oCvUE0gU3RldmUgR3J1YmIgPHNncnViYkByZWRo
YXQuY29tPiB3cm90ZToKPgo+IEhlbGxvIFBhdWwsCj4KPiBPbiBUdWVzZGF5LCBGZWJydWFyeSAy
OCwgMjAyMyA1OjA0OjA0IFBNIEVTVCBQYXVsIE1vb3JlIHdyb3RlOgo+ID4gLi4uIGlmIHlvdSBs
b29rIGNsb3NlbHkgeW91J2xsIG5vdGljZSB0aGF0IHRoZSAjMjg5IGV2ZW50ICh0aGUgYXN5bmMK
PiA+IFVSSU5HT1ApIGlzIG1pc3NpbmcgZnJvbSB0aGUgYXVzZWFyY2ggb3V0cHV0Lgo+Cj4gVGhh
bmtzIGZvciB0aGUgYnVnIHJlcG9ydC4gTGV0IG1lIGtub3cgaWYgeW91IHNlZSBhbnl0aGluZyBl
bHNlLgo+Cj4gVXBzdHJlYW0gY29tbWl0IDdkMzVlMTQgc2hvdWxkIGZpeCBwYXJzaW5nIFVSSU5H
T1AgYW5kIERNX0NUUkwgcmVjb3Jkcy4KCkZpbmFsbHkgZ290IGEgY2hhbmNlIHRvIHRyeSB0aGUg
Zml4LCBhbmQgaXQgbG9va3MgbGlrZSBpdCBzb2x2ZXMgdGhlCnByb2JsZW0gZm9yIG1lLiAgVGhh
bmtzLgoKSW4gY2FzZSBhbnlvbmUgd2FudHMgYSBoYWNreSBwYXRjaGVkIHNvdXJjZSBSUE0sIEkg
cHV0IHRoZSBjb3B5IEknbQp1c2luZyBhdCB0aGUgbGluayBiZWxvdzoKCiogaHR0cHM6Ly9kcm9w
LnBhdWwtbW9vcmUuY29tLzEyMC5PSDFDL2F1ZGl0LTMuMS0yLjEuc2VjbmV4dC5mYzM5LnNyYy5y
cG0KCltUaGUgbGluayBhYm92ZSBzaG91bGQgd29yayBmb3IgdGhlIG5leHQgMTIwIGRheXNdCgot
LSAKcGF1bC1tb29yZS5jb20KCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRp
dEByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtYXVkaXQK

