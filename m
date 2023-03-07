Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2413B6AF75B
	for <lists+linux-audit@lfdr.de>; Tue,  7 Mar 2023 22:17:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678223846;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SuLjHPKxzw5yhd91a9hO/Sp3YnCUFityJaZGLt3nBzs=;
	b=Wyhc0GWudBHGhuwwBcgS6LGwqj8zJn0Tj0oRDtatlFJ4JdNugUxa0cLfp5goCvmJusTBTu
	Q46mE810+ub1MB44FMcV0gvAgco1PeeSlEFzpuqy25soATqIlhH9vWGuaq1SCDil9RVjU9
	vi5TIGmAQUrqfHJ5V8mU1VB7aaxgTxo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-MLwv3-8KMvOS13C22zKzYQ-1; Tue, 07 Mar 2023 16:17:20 -0500
X-MC-Unique: MLwv3-8KMvOS13C22zKzYQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB922185A794;
	Tue,  7 Mar 2023 21:17:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C9E5435454;
	Tue,  7 Mar 2023 21:17:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A825A19465B3;
	Tue,  7 Mar 2023 21:17:10 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 99D3A1946594 for <linux-audit@listman.corp.redhat.com>;
 Tue,  7 Mar 2023 21:17:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 867114029A7A; Tue,  7 Mar 2023 21:17:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.16.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 627DF40B40E4;
 Tue,  7 Mar 2023 21:17:09 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: audit userspace problems with io_uring async ops
Date: Tue, 07 Mar 2023 16:17:08 -0500
Message-ID: <12213468.O9o76ZdvQC@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhRMJq1gJPoR79AxM1JphmGtxhGMYBkd=Ptuaq3WBjX2Bw@mail.gmail.com>
References: <CAHC9VhRMJq1gJPoR79AxM1JphmGtxhGMYBkd=Ptuaq3WBjX2Bw@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

Hello Paul,

On Tuesday, February 28, 2023 5:04:04 PM EST Paul Moore wrote:
> ... if you look closely you'll notice that the #289 event (the async
> URINGOP) is missing from the ausearch output.

Thanks for the bug report. Let me know if you see anything else.

Upstream commit 7d35e14 should fix parsing URINGOP and DM_CTRL records. Btw, 
has anyone ever seen a DM_CTRL record? I don't think they are following our 
guidelines.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

