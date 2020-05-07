Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 284F51C9A86
	for <lists+linux-audit@lfdr.de>; Thu,  7 May 2020 21:11:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588878677;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bWxumSdOeIo44IGKqgMpIhA4wwqruK/LSoMh9V1YveA=;
	b=JrvqObV3iIXKzm6pis0syTu+y76X1VR5iPd6YICp5j12EG76RXpJrCFBzdXwNi4qNveSHm
	lOnq91IBKvAEJn6R3+2tIKu0qaONmfn9c2HvjUUz3Nj+sYtDwkC0pJeywOStJQj/EmJy62
	ZbOvv9Bklt+LaWe8o7YI0/yC2y0qm7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-Nx05iQHmNVeVF8GM1850Sw-1; Thu, 07 May 2020 15:10:45 -0400
X-MC-Unique: Nx05iQHmNVeVF8GM1850Sw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48BBC56B39;
	Thu,  7 May 2020 19:10:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB05E5D9C5;
	Thu,  7 May 2020 19:10:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A9E551809542;
	Thu,  7 May 2020 19:10:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04777ZC0020512 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 03:07:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C29FA10CB280; Thu,  7 May 2020 07:07:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEC2610CB27F
	for <linux-audit@redhat.com>; Thu,  7 May 2020 07:07:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61E141019CAF
	for <linux-audit@redhat.com>; Thu,  7 May 2020 07:07:33 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-38-uhWUm_9VPxCgnOSqX2S4Zw-1; Thu, 07 May 2020 03:07:31 -0400
X-MC-Unique: uhWUm_9VPxCgnOSqX2S4Zw-1
Received: by mail-ed1-f65.google.com with SMTP id w2so4453142edx.4;
	Thu, 07 May 2020 00:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=RQbMvC1ag/SPzt3A0iv4z8R55U/VKwxU9VmHI0/FJRU=;
	b=DHecy/64yJKokKAiMK+LW6lAUVWJRKexz9ytCczmCZCSjFCY8xHmOa1BhHpR3H/wnN
	+W+JUPl4xGZpoT5g4glvOaO1A9RAg23WXmbqX3YrtQEqfbJaBPL+MrgA4d1KyAO1p8I8
	0d/agB5yFdz2zlhVe2sfA0FoPpxZ9fD0SlO4/gWTOUzVw+oEGXj9/NmX1hZsjk3ts9Ss
	gaCOrGxeK2CyL8Ixsf7pY9ItR6rTgv4SQiCFeSc/BHE/2w3fCIlJCKqkEy9aQFOGjMyS
	vCMjctO153VzW5oUmxyUUnJHfJBUdOogeM3iovT7C9a/MlAz6TiPsPyBUfet+id5IsIe
	dS1g==
X-Gm-Message-State: AGi0PuY/IeFmylKeXMgH4TBYBZIzASHtnZ1eEMGJBW+dCJzn7Sl/qF7A
	HWtoNO0LgBrcXEKm3cX3aM6Lx38azdpDu7aEcgE=
X-Google-Smtp-Source: APiQypL8AC7ZUZnP0qgOLELJh2mB0qf4DRtMwN4Iryo60fDs4rqEG8PDwXDJX033RYCz1rFZGBj6H05V6VK++Hv+CxM=
X-Received: by 2002:aa7:c2d2:: with SMTP id m18mr10709938edp.142.1588835249498;
	Thu, 07 May 2020 00:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LRH.2.21.2002041054320.12768@namei.org>
	<CALrft9_tam87oevNC6LDG_bZoH+BgfrD4Or3yQudDoVqTqBdvg@mail.gmail.com>
In-Reply-To: <CALrft9_tam87oevNC6LDG_bZoH+BgfrD4Or3yQudDoVqTqBdvg@mail.gmail.com>
From: Elena Reshetova <elena.reshetova@gmail.com>
Date: Thu, 7 May 2020 10:07:18 +0300
Message-ID: <CALrft98SzLkw3M0shurUsNxsNSuSR3qN236rX4mEvC8GsrnnWQ@mail.gmail.com>
Subject: [ANNOUNCE][CFP] Linux Security Summit Europe 2020
To: linux-security-module@vger.kernel.org
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04777ZC0020512
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 07 May 2020 15:10:34 -0400
Cc: Linux Security Summit Program Committee <lss-pc@lists.linuxfoundation.org>,
	keyrings@linux-nfs.org, gentoo-hardened@gentoo.org,
	kernel-hardening@lists.openwall.com, selinux@vger.kernel.org,
	linux-kernel@vger.kernel.org, tpmdd-devel@lists.sourceforge.net,
	Audit-ML <linux-audit@redhat.com>, linux-crypto@vger.kernel.org,
	lwn@lwn.net, linux-integrity@vger.kernel.org,
	fedora-selinux-list@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09CiAgICAgICAgICAgICAgICAgICBBTk5PVU5DRU1FTlQgQU5E
IENBTEwgRk9SIFBBUlRJQ0lQQVRJT04KCiAgICAgICAgICAgICAgICAgICAgICAgIExJTlVYIFNF
Q1VSSVRZIFNVTU1JVCBFVVJPUEUgMjAyMAoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDI5LTMwIE9DVE9CRVIKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
RFVCTElOLCBJUkVMQU5ECj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQoKREVTQ1JJUFRJT04KCkxpbnV4
IFNlY3VyaXR5IFN1bW1pdCBFdXJvcGUgKExTUy1FVSkgaXMgYSB0ZWNobmljYWwgZm9ydW0gZm9y
CmNvbGxhYm9yYXRpb24gYmV0d2VlbiBMaW51eCBkZXZlbG9wZXJzLCByZXNlYXJjaGVycywgYW5k
IGVuZC11c2Vycy4gIEl0cwpwcmltYXJ5IGFpbSBpcyB0byBmb3N0ZXIgY29tbXVuaXR5IGVmZm9y
dHMgaW4gYW5hbHl6aW5nIGFuZCBzb2x2aW5nIExpbnV4CnNlY3VyaXR5IGNoYWxsZW5nZXMuCgog
VGhlIHByb2dyYW0gY29tbWl0dGVlIGN1cnJlbnRseSBzZWVrcyBwcm9wb3NhbHMgZm9yOgoKICAg
KiBSZWZlcmVlZCBQcmVzZW50YXRpb25zOgogICAgIDQ1IG1pbnV0ZXMgaW4gbGVuZ3RoLgoKICAg
KiBQYW5lbCBEaXNjdXNzaW9uIFRvcGljczoKICAgICA0NSBtaW51dGVzIGluIGxlbmd0aC4KCiAg
ICogU2hvcnQgVG9waWNzOgogICAgIDMwIG1pbnV0ZXMgaW4gdG90YWwsIGluY2x1ZGluZyBhdCBs
ZWFzdCAxMCBtaW51dGVzIGRpc2N1c3Npb24uCgogICAqIFR1dG9yaWFscwogICAgIDkwIG1pbnV0
ZXMgaW4gbGVuZ3RoLgoKVHV0b3JpYWwgc2Vzc2lvbnMgc2hvdWxkIGJlIGZvY3VzZWQgb24gYWR2
YW5jZWQgTGludXggc2VjdXJpdHkgZGVmZW5zZQp0b3BpY3Mgd2l0aGluIGFyZWFzIHN1Y2ggYXMg
dGhlIGtlcm5lbCwgY29tcGlsZXIsIGFuZCBzZWN1cml0eS1yZWxhdGVkCmxpYnJhcmllcy4gIFBy
aW9yaXR5IHdpbGwgYmUgZ2l2ZW4gdG8gdHV0b3JpYWxzIGNyZWF0ZWQgZm9yIHRoaXMgY29uZmVy
ZW5jZSwKYW5kIHRob3NlIHdoZXJlIHRoZSBwcmVzZW50ZXIgYSBsZWFkaW5nIHN1YmplY3QgbWF0
dGVyIGV4cGVydCBvbiB0aGUgdG9waWMuCgpUb3BpYyBhcmVhcyBpbmNsdWRlLCBidXQgYXJlIG5v
dCBsaW1pdGVkIHRvOgoKICAgKiBLZXJuZWwgc2VsZi1wcm90ZWN0aW9uCiAgICogQWNjZXNzIGNv
bnRyb2wKICAgKiBDcnlwdG9ncmFwaHkgYW5kIGtleSBtYW5hZ2VtZW50CiAgICogSW50ZWdyaXR5
IHBvbGljeSBhbmQgZW5mb3JjZW1lbnQKICAgKiBIYXJkd2FyZSBTZWN1cml0eQogICAqIElvVCBh
bmQgZW1iZWRkZWQgc2VjdXJpdHkKICAgKiBWaXJ0dWFsaXphdGlvbiBhbmQgY29udGFpbmVycwog
ICAqIFN5c3RlbS1zcGVjaWZpYyBzeXN0ZW0gaGFyZGVuaW5nCiAgICogQ2FzZSBzdHVkaWVzCiAg
ICogU2VjdXJpdHkgdG9vbHMKICAgKiBTZWN1cml0eSBVWAogICAqIEVtZXJnaW5nIHRlY2hub2xv
Z2llcywgdGhyZWF0cyAmIHRlY2huaXF1ZXMKCiAgUHJvcG9zYWxzIHNob3VsZCBiZSBzdWJtaXR0
ZWQgdmlhOgoKICAgaHR0cHM6Ly9ldmVudHMubGludXhmb3VuZGF0aW9uLm9yZy9saW51eC1zZWN1
cml0eS1zdW1taXQtZXVyb3BlL3Byb2dyYW0vY2ZwLwoKREFURVMKCiAgKiBDRlAgY2xvc2U6ICAg
ICAgICAgICAgSnVseSAzMQogICogQ0ZQIG5vdGlmaWNhdGlvbnM6ICAgIEF1Z3VzdCAxMAogICog
U2NoZWR1bGUgYW5ub3VuY2VkOiAgIFNlcHRlbWJlciAxCiAgKiBFdmVudDogICAgICAgICAgICAg
ICAgT2N0b2JlciAyOS0zMAoKQ09WSUQtMTkgU0lUVUFUSU9OCgpDdXJyZW50bHkgTFNTLUVVIGlz
IHBsYW5uZWQgYXMgaW4tcGVyc29uIGV2ZW50LCBob3dldmVyIHRoaXMgd291bGQgYmUKcmUtZXZh
bHVhdGVkIGNsb3NlciB0byB0aGUgZXZlbnQgaXRzZWxmIGFuZCBpZiB0aGUgc2l0dWF0aW9uIGlu
IEV1cm9wZSBkb2VzCm5vdCBwZXJtaXQgc3VjaCBldmVudHMsIGl0IHdvdWxkIGJlIHN3aXRjaGVk
IHRvIGEgdmlydHVhbCBldmVudCwgc2ltaWxhcmx5CmFzIHRoaXMgeWVhcuKAmXMgTFNTLU5BLgoK
V0hPIFNIT1VMRCBBVFRFTkQKCldlJ3JlIHNlZWtpbmcgYSBkaXZlcnNlIHJhbmdlIG9mIGF0dGVu
ZGVlcyBhbmQgd2VsY29tZSBwYXJ0aWNpcGF0aW9uIGJ5CnBlb3BsZSBpbnZvbHZlZCBpbiBMaW51
eCBzZWN1cml0eSBkZXZlbG9wbWVudCwgb3BlcmF0aW9ucywgYW5kIHJlc2VhcmNoLgoKTFNTLUVV
IGlzIGEgdW5pcXVlIGdsb2JhbCBldmVudCB0aGF0IHByb3ZpZGVzIHRoZSBvcHBvcnR1bml0eSB0
byBwcmVzZW50IGFuZApkaXNjdXNzIHlvdXIgd29yayBvciByZXNlYXJjaCB3aXRoIGtleSBMaW51
eCBzZWN1cml0eSBjb21tdW5pdHkgbWVtYmVycyBhbmQKbWFpbnRhaW5lcnMuICBJdOKAmXMgYWxz
byB1c2VmdWwgZm9yIHRob3NlIHdobyB3aXNoIHRvIGtlZXAgdXAgd2l0aCB0aGUgbGF0ZXN0Cmlu
IExpbnV4IHNlY3VyaXR5IGRldmVsb3BtZW50IGFuZCB0byBwcm92aWRlIGlucHV0IHRvIHRoZSBk
ZXZlbG9wbWVudApwcm9jZXNzLgoKV0VCIFNJVEUKCiAgICBodHRwczovL2V2ZW50cy5saW51eGZv
dW5kYXRpb24ub3JnL2xpbnV4LXNlY3VyaXR5LXN1bW1pdC1ldXJvcGUvCgpUV0lUVEVSCgogIEZv
ciBldmVudCB1cGRhdGVzIGFuZCBhbm5vdW5jZW1lbnRzLCBmb2xsb3c6CgogICAgaHR0cHM6Ly90
d2l0dGVyLmNvbS9MaW51eFNlY1N1bW1pdAoKICAgICNsaW51eHNlY3VyaXR5c3VtbWl0CgpQUk9H
UkFNIENPTU1JVFRFRQoKICBUaGUgcHJvZ3JhbSBjb21taXR0ZWUgZm9yIExTUyAyMDIwIGlzOgoK
ICAgICogSmFtZXMgTW9ycmlzLCBNaWNyb3NvZnQKICAgICogU2VyZ2UgSGFsbHluLCBDaXNjbwog
ICAgKiBQYXVsIE1vb3JlLCBDaXNjbwogICAgKiBTdGVwaGVuIFNtYWxsZXksIE5TQQogICAgKiBF
bGVuYSBSZXNoZXRvdmEsIEludGVsCiAgICAqIEpvaG4gSm9oYW5zZW4sIENhbm9uaWNhbAogICAg
KiBLZWVzIENvb2ssIEdvb2dsZQogICAgKiBDYXNleSBTY2hhdWZsZXIsIEludGVsCiAgICAqIE1p
bWkgWm9oYXIsIElCTQogICAgKiBEYXZpZCBBLiBXaGVlbGVyLCBJbnN0aXR1dGUgZm9yIERlZmVu
c2UgQW5hbHlzZXMKCiAgVGhlIHByb2dyYW0gY29tbWl0dGVlIG1heSBiZSBjb250YWN0ZWQgYXMg
YSBncm91cCB2aWEgZW1haWw6CiAgICBsc3MtcGMgKCkgbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
ZwoKCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0
dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdA==

