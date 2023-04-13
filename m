Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3976E149C
	for <lists+linux-audit@lfdr.de>; Thu, 13 Apr 2023 20:50:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681411839;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pR2qeqAE+VirlzEbO3RDvjL8jOvX+eVndUJYEWMJH0w=;
	b=X9nbzyNN0A/wZ6sb7nymAMVjfrQ3qfV75O5x7YZXrTDnCJSZIwkXOjJwOTij0ePvsAW1Se
	mHrt998brDNbmLIT+WedYNocoK34QdRuH+LtrjH9Hq7y2qu7MO2KFK2H9eU9Pa1rk3+Wal
	Zb3kSlvUNrMbtVX3qPNSFZ+I/ZVJHJY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-cfMH2E5zMPiW8HWn28LW2g-1; Thu, 13 Apr 2023 14:50:35 -0400
X-MC-Unique: cfMH2E5zMPiW8HWn28LW2g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3253085A5B1;
	Thu, 13 Apr 2023 18:50:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A8072492B01;
	Thu, 13 Apr 2023 18:50:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E12781946A75;
	Thu, 13 Apr 2023 18:50:26 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DE0A719465B6 for <linux-audit@listman.corp.redhat.com>;
 Thu, 13 Apr 2023 18:50:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BC35E2027044; Thu, 13 Apr 2023 18:50:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B45D82027043
 for <linux-audit@redhat.com>; Thu, 13 Apr 2023 18:50:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93F4D101A553
 for <linux-audit@redhat.com>; Thu, 13 Apr 2023 18:50:25 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-Y2P7KpjPN-OJwrg1Dib_EQ-1; Thu, 13 Apr 2023 14:50:24 -0400
X-MC-Unique: Y2P7KpjPN-OJwrg1Dib_EQ-1
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-54fb615ac3dso87200387b3.2
 for <linux-audit@redhat.com>; Thu, 13 Apr 2023 11:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681411823; x=1684003823;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ym42IjUaFjBl55KgOX7+/UMs9jx8bvTKsKd1fkeW1k0=;
 b=Tetz1fAormrKDhR/scZqdMc8DT81OJ3wtp7fcS2EMQa1JdhrAUWmMf8lojto9ox+Wm
 kHkg5rFJxYehsvBdHr66IEchqNPU6ryamHGYpTuV073C3mGAlRFmHysiCsdYEjPpYehL
 OQ8PUljn5p6E6s7Ai/5WgQdE2kQ5d8JnkggGIvcwsmwy68/tkh/3wd5FK8rK0/uFex1G
 PA4pza4l/3NAbxIMQKzVDxpHrcvMdGcOQt2YenaWQ33cifN3bIxWJbOvWXFg14pInwAn
 ocbavlCj5s/9Hc+09GC4FGLt1G/VHQihtyOL7xsrfUznN4n3E0PJkiQbSfxtsty1ezIr
 WYqg==
X-Gm-Message-State: AAQBX9eW4lxRH0ZioFsLMUDa/ewqZvqHH2yQS6NAn9/HxjaVlw02XV/w
 PfWxFMNusIKOFYPzvMbDz4Bn/ns7sNgoxCXGwx1seI/YOufiUTV4sg==
X-Google-Smtp-Source: AKy350b98XEBNBr+XyzBfzSiLlxsrJ9Rx0qwJprWx63pMs50yodLPwxsRQO7czUXR66nPSWiGXFKGWdfa+02OnwaiSU=
X-Received: by 2002:a81:ac57:0:b0:54d:3afc:d503 with SMTP id
 z23-20020a81ac57000000b0054d3afcd503mr2056001ywj.8.1681411823425; Thu, 13 Apr
 2023 11:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <BN7PR21MB163531AF592295002D4D37D98FDE9@BN7PR21MB1635.namprd21.prod.outlook.com>
 <BN7PR21MB1635C32B81A78262B147C1358F989@BN7PR21MB1635.namprd21.prod.outlook.com>
In-Reply-To: <BN7PR21MB1635C32B81A78262B147C1358F989@BN7PR21MB1635.namprd21.prod.outlook.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 13 Apr 2023 14:50:12 -0400
Message-ID: <CAHC9VhR-XZrmgK10azpJZGEm+Fx7MqZr7=sWqXtp=uLcaS4tig@mail.gmail.com>
Subject: Re: small patch for issue with rules that have been (incorrecly)
 copied from Windows
To: Carlos De Avillez <Carlos.DeAvillez@microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: "linux-audit@redhat.com" <linux-audit@redhat.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBBcHIgMTMsIDIwMjMgYXQgMTI6MjXigK9QTSBDYXJsb3MgRGUgQXZpbGxlego8Q2Fy
bG9zLkRlQXZpbGxlekBtaWNyb3NvZnQuY29tPiB3cm90ZToKPgo+IEhlbGxvIGFnYWluLAo+Cj4g
SnVzdCBjaGVja2luZyBpcyB0aGVyZSBpcyBpbnRlcmVzdCBpbiB0aGUgYmVsb3cuCgpJIG5vdGlj
ZWQgdGhhdCB5b3VyIGVtYWlsIGVuZGVkIHVwIGluIG15IHNwYW0gZm9sZGVyLCBsaWtlbHkgYmVj
YXVzZQppdCB3YXMgbm90IHBsYWludGV4dCwgYnV0IHdobyBrbm93cyBmb3Igc3VyZS4gIFlvdSBt
aWdodCB3YW50IHRvIHRyeQpwb3N0aW5nIHlvdXIgcGF0Y2ggYXMgYSBHaXRIdWIgUFIgc2luY2Ug
aXQgbG9va3MgbGlrZSBTdGV2ZSBjaGVja3MKYm90aCB0aGUgbWFpbGluZyBsaXN0IGFuZCBHaXRI
dWIgZm9yIHBhdGNoZXMuCgoqIGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1hdWRpdC9hdWRpdC11
c2Vyc3BhY2UKCi0tIApwYXVsLW1vb3JlLmNvbQoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0
CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1hdWRpdAo=

