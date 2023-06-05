Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 76444722ED4
	for <lists+linux-audit@lfdr.de>; Mon,  5 Jun 2023 20:38:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685990336;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=MBSBuvcdT90kc2RjGDPqrvxwFjCPyAcsbXVCDEcZDNQ=;
	b=QOOhE/eQom2SU6a3hYWSX4gwyT5bdTUBTcd6CK6tYDZiV1V9hH5dt1mEkmGgoh7Kj8BXH0
	zpfomRJPzoTf9PZ7hhvgbwuzZhl/cNmYG7MgmA12PYw3ncLki/Oonm60Vz20Cm0nhztKX8
	xTI0cPNCF4R7jon9pxM9z4rE8gdqhWg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-11P68QbiO3WzMsd9eY9txQ-1; Mon, 05 Jun 2023 14:38:52 -0400
X-MC-Unique: 11P68QbiO3WzMsd9eY9txQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C052811E7F;
	Mon,  5 Jun 2023 18:38:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 859021121314;
	Mon,  5 Jun 2023 18:38:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2F1B019465B6;
	Mon,  5 Jun 2023 18:38:26 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B823A19465A3 for <linux-audit@listman.corp.redhat.com>;
 Mon,  5 Jun 2023 18:17:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A6EDA7AE4; Mon,  5 Jun 2023 18:17:44 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F9129E90
 for <linux-audit@redhat.com>; Mon,  5 Jun 2023 18:17:44 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80D9C1C02D29
 for <linux-audit@redhat.com>; Mon,  5 Jun 2023 18:17:44 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-0mcQwcBmORKAJHZf80zxXA-1; Mon, 05 Jun 2023 14:17:42 -0400
X-MC-Unique: 0mcQwcBmORKAJHZf80zxXA-1
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-4f3bb61f860so6686082e87.3
 for <linux-audit@redhat.com>; Mon, 05 Jun 2023 11:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685989060; x=1688581060;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ni9a7ok6/KAArzv3L80e8XnDXnvLq0DaVKMIskpIL38=;
 b=Fg24BhEPv2f1F37G4OnOXNlXCQyIP1AWiAzVwn/0mNhXexWLfgz4ICPSsTRcNoOGUv
 Sc42CXvs0x5xBWq6zJJg0JIjVtYVbNUrOs4MltGTjd/8sOXJcyYfHvLKXxYxhXvfweZo
 VEPvNnkIJb0wWi1WqiOERTzNRaO1Y224xafGBZGF4DEumYD492grY7LMfBZ5n15BtxSd
 XPC/hlbJXimpP6qsFF2YkVlQ+zKnANC8BOrcwSt+XNft/JYP0s1+HXEi+WzGUDEjH+20
 WYWQAnQDPMPJzWfWqwNdAEQz7KBw6Q/GYsLhDfFc9auSll2yEFj+fD0eMtwT495dJ1Le
 gnPA==
X-Gm-Message-State: AC+VfDyoW0R+pfuy4vbFvUlgzXe/X7b5CSc0PlpDIrnjV4lsCkydYzUh
 lwmQ52iMT9D8D0YIgxg8yRerqVeZu8FWZiy2Csyc6Lfv
X-Google-Smtp-Source: ACHHUZ6mx2unZenDDjuldvKvzO+txj1qXhAmJ8yXgroq7BqhWaZQk7saiJGrwqd2orNkIPimaUxWlYWvbvVyJD5JUoI=
X-Received: by 2002:a19:c20d:0:b0:4f6:21f6:214b with SMTP id
 l13-20020a19c20d000000b004f621f6214bmr2453109lfc.10.1685989060177; Mon, 05
 Jun 2023 11:17:40 -0700 (PDT)
MIME-Version: 1.0
From: Vincent Abraham <vincent.ahm@gmail.com>
Date: Mon, 5 Jun 2023 18:17:28 -0400
Message-ID: <CAMKmEH-s9kZn5kqkjb_QHA2X02TWX+utqu365-7cRKMM7E5eVQ@mail.gmail.com>
Subject: Comprehensive Documentation on the Linux Audit Framework
To: linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Mon, 05 Jun 2023 18:38:24 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============4641763638009786036=="

--===============4641763638009786036==
Content-Type: multipart/alternative; boundary="00000000000006f19b05fd65eb9c"

--00000000000006f19b05fd65eb9c
Content-Type: text/plain; charset="UTF-8"

Greetings,
Could anyone point me to a source for comprehensive documentation for the
Linux audit framework? I want to know how the framework interacts with the
kernel to retrieve log information.

Thanks.

--00000000000006f19b05fd65eb9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Greetings,=C2=A0<div>Could anyone point me to a source for=
 comprehensive documentation for the Linux audit framework? I want to know =
how the framework interacts with the kernel to retrieve log information.</d=
iv><div><br></div><div>Thanks.</div><div></div></div>

--00000000000006f19b05fd65eb9c--

--===============4641763638009786036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============4641763638009786036==--

