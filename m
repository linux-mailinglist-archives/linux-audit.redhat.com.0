Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C07F3722EE9
	for <lists+linux-audit@lfdr.de>; Mon,  5 Jun 2023 20:47:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685990828;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=o4bfA0nyHt1atA7dgNmi+lYHOBIIyAch8OWp7db1FCY=;
	b=Xz5Qr8WIBbNI+D9Fv8p9EKs+MjhHl6WT7cjZDegwOn1iTa127wK1U7OXc0UWjcv48zFVDM
	kFY2XMDLVuzmMlmQg+EAXj6D7+N7Nq1ke/aWOvdWqWjB/j+F+25BAr8p1h0e4Za+GNu4YR
	2bw/ZWVzWAf9H3gQi+LDWQEsFXh1dgU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-bdSFOQiEPmyH0yu0RALFoQ-1; Mon, 05 Jun 2023 14:47:06 -0400
X-MC-Unique: bdSFOQiEPmyH0yu0RALFoQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73604811E96;
	Mon,  5 Jun 2023 18:47:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A77721121314;
	Mon,  5 Jun 2023 18:47:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F3DB819465B7;
	Mon,  5 Jun 2023 18:47:02 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5BF791946595 for <linux-audit@listman.corp.redhat.com>;
 Mon,  5 Jun 2023 18:47:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D734340D1B61; Mon,  5 Jun 2023 18:47:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.22.50.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5053940D1B60;
 Mon,  5 Jun 2023 18:47:01 +0000 (UTC)
Date: Mon, 5 Jun 2023 14:46:59 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Vincent Abraham <vincent.ahm@gmail.com>
Subject: Re: Comprehensive Documentation on the Linux Audit Framework
Message-ID: <ZH4to0Fc8WykRS+b@madcap2.tricolour.ca>
References: <CAMKmEH-s9kZn5kqkjb_QHA2X02TWX+utqu365-7cRKMM7E5eVQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKmEH-s9kZn5kqkjb_QHA2X02TWX+utqu365-7cRKMM7E5eVQ@mail.gmail.com>
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
Cc: linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023-06-05 18:17, Vincent Abraham wrote:
> Greetings,
> Could anyone point me to a source for comprehensive documentation for the
> Linux audit framework? I want to know how the framework interacts with the
> kernel to retrieve log information.

This is the place to start:
	https://github.com/linux-audit/audit-documentation/wiki

And this is the top level page for the 4 sub-projects:
	https://github.com/linux-audit

> Thanks.

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635
--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

