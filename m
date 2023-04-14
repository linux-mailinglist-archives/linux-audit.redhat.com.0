Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9586E2637
	for <lists+linux-audit@lfdr.de>; Fri, 14 Apr 2023 16:51:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681483867;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FR/u4ykeKQvFrJi9hFALo9VI2vM9sY34ficU8MqkZ80=;
	b=jB4TqX991tmc45uSkVIWVKoMQorzgIaFOfWFbLguws69312DdRdjgRabY/1/njhTUUcRHA
	P9yVxI1n2Srxl+NvhXHQ/GRSKzdFKdB83rBAoV+TU4f3g8pll2H3fhQ5PZsnked4u/2QB4
	z/V4S85CLXD+RA7fMvrfCzsxlMQKX0Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-fv4r01_UN3Svrd4Gt_bfOg-1; Fri, 14 Apr 2023 10:51:04 -0400
X-MC-Unique: fv4r01_UN3Svrd4Gt_bfOg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B20A6101A54F;
	Fri, 14 Apr 2023 14:51:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6D1BABC88;
	Fri, 14 Apr 2023 14:50:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A051419472D1;
	Fri, 14 Apr 2023 14:50:53 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EBA7519472C9 for <linux-audit@listman.corp.redhat.com>;
 Fri, 14 Apr 2023 14:50:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DC571C1602A; Fri, 14 Apr 2023 14:50:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.34.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1DC3C16028;
 Fri, 14 Apr 2023 14:50:40 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: Re: small patch for issue with rules that have been (incorrecly)
 copied from Windows
Date: Fri, 14 Apr 2023 10:50:40 -0400
Message-ID: <2678560.mvXUDI8C0e@x2>
Organization: Red Hat
In-Reply-To: <BN7PR21MB1635C32B81A78262B147C1358F989@BN7PR21MB1635.namprd21.prod.outlook.com>
References: <BN7PR21MB163531AF592295002D4D37D98FDE9@BN7PR21MB1635.namprd21.prod.outlook.com>
 <BN7PR21MB1635C32B81A78262B147C1358F989@BN7PR21MB1635.namprd21.prod.outlook.com>
MIME-Version: 1.0
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
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

On Thursday, April 13, 2023 12:23:31 PM EDT Carlos De Avillez wrote:
> Just checking is there is interest in the below.

Applied. Thanks!

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

