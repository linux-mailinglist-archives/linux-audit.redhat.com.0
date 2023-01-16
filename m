Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D81C66CECE
	for <lists+linux-audit@lfdr.de>; Mon, 16 Jan 2023 19:28:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673893707;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nrCYIrEShw26ehDcFUkUWfP+a2WmixLUjeVXJg+Xz4Y=;
	b=AhzcXalx4XsNLkD15nva/Wfu8ME9suRKCOqvG1lLG9qCqwOhp8HgzQTsUtIYcI80Wv/lu4
	+3ma+MNxoPkwq5bjwv7oG920ygYx8RS53Ow2ruT+VbsQ+c5/3tEeO7dC6cIVwNQuZLav/3
	ydceCRgkpVaj0XY4PSdtoS1CX3P3Msg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-qHADYbUqP7y1elQRAxw5aQ-1; Mon, 16 Jan 2023 13:28:26 -0500
X-MC-Unique: qHADYbUqP7y1elQRAxw5aQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3B8F3C0F394;
	Mon, 16 Jan 2023 18:28:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB1A340C115E;
	Mon, 16 Jan 2023 18:28:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 061F419465B3;
	Mon, 16 Jan 2023 18:28:17 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CE5FA1946589 for <linux-audit@listman.corp.redhat.com>;
 Mon, 16 Jan 2023 18:28:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 672E94010D46; Mon, 16 Jan 2023 18:28:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.33.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F83740C6EC4;
 Mon, 16 Jan 2023 18:28:15 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Linux-audit@redhat.com, linux-audit@redhat.com
Subject: Re: Difference between BITMAP_EXECUTABLE_PATH and
 BITMAP_EXCLUDE_EXTEND flags
Date: Mon, 16 Jan 2023 13:28:14 -0500
Message-ID: <2405286.jE0xQCEvom@x2>
Organization: Red Hat
In-Reply-To: <CAKX_gjqqLBGqgtRAyBDphOZh-=V2LBx7YdnRS0EMsnZDtve4jg@mail.gmail.com>
References: <CAKX_gjqqLBGqgtRAyBDphOZh-=V2LBx7YdnRS0EMsnZDtve4jg@mail.gmail.com>
MIME-Version: 1.0
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, January 16, 2023 11:15:46 AM EST Avtansh Gupta wrote:
> Hello All,
> 
> Please could you help me understand the difference between the following
> flags which are being used?
> 
> AUDIT_FEATURE_BITMAP_EXECUTABLE_PATH

This ^^^ means the kernel supports -F exe=  in the rules.
https://listman.redhat.com/archives/linux-audit/2015-August/010585.html

> AUDIT_FEATURE_BITMAP_EXCLUDE_EXTEND

This ^^^ means that the exclude filter supports many more kinds of fields than 
the original design allowed for. 
https://listman.redhat.com/archives/linux-audit/2016-June/011433.html

For upstream kernels and ones derived after it was release, the second 
implies the first one is already included.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

