Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AE37A6FF5
	for <lists+linux-audit@lfdr.de>; Wed, 20 Sep 2023 02:55:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695171334;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2kmonvylzneXOPMZJjegYkC7aadO+hRs3TRSRiN9lEQ=;
	b=XS7lDnT5VwdgWPyldR/vP5lkcgB5o7XrpuNnbBE8B/YDUIrBC+nMc68axtAiayk5ZebLlA
	2nPM+pc+UCVgYbQF7m0nJOTcttnv26cImEhqmkZYDYtz4yfrwRLoR3hPHXfWNZ9SvXkwOH
	LqrrI89vBXAgHiYs8pc2z+Z0bUYJaTg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-kHtTJ-5DOaeNywQC6e8tqw-1; Tue, 19 Sep 2023 20:55:29 -0400
X-MC-Unique: kHtTJ-5DOaeNywQC6e8tqw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83E4A800888;
	Wed, 20 Sep 2023 00:55:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 270F740C6EC0;
	Wed, 20 Sep 2023 00:55:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5727919465B9;
	Wed, 20 Sep 2023 00:55:17 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DCA15194658D for <linux-audit@listman.corp.redhat.com>;
 Tue, 19 Sep 2023 23:33:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AD776711280; Tue, 19 Sep 2023 23:33:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.17.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87358492B16;
 Tue, 19 Sep 2023 23:33:48 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: Re: 128 Character limit on proctitle field?
Date: Tue, 19 Sep 2023 19:32:22 -0400
Message-ID: <3785033.kQq0lBPeGt@x2>
Organization: Red Hat
In-Reply-To: <f04d10f4d94c4c2295031fee26dc8082@jhuapl.edu>
References: <f04d10f4d94c4c2295031fee26dc8082@jhuapl.edu>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

On Friday, September 15, 2023 12:15:12 PM EDT Wieprecht, Karen M. wrote:
> We're working with Docker and podman, and I'm working on parsing the audit
> data we get to flag prohibited and missing command options based on STIG
> guidelines.   I normally extract the proctitle from the raw auditd data ,
> but these commands are very long with sometimes 23 or more command line
> parameters ,  and I noticed that all of the auditd proctitle data for the
> lengthier commands is being cut off at 128 characters.

The proctitle event commit message explains why it was created:
https://listman.redhat.com/archives/linux-audit/2014-February/008778.html

The comm field is only 16 characters long. So, it tries to capture the first 
128 bytes so that at least android comm fields can be deduced since they are 
almost always larger than 16 bytes.

> I'm bringing this up  for two reasons:
> 
>      One,  not everyone working with this data may realize that there seems
> to be a character limit, and second, if this is by chance a bug as opposed
> to intentional,  then I'm hoping we can get a fix cooking for it?

The record that contains all of the command line is the execve record. It has 
all parameters even if it's 10,000. So, you may want to try auditing by exec 
of specific applications to get everything.

Also, as mentioned in the commit, proctitle is based off of comm. This can be 
controlled by user space to misdirect attention by spoof the program name.

> In the meantime,  I may be able to work around this by piecing together the
> full command from the "a#= "  fields, but it would be much easier if
> proctitle wasn't cut off after 128 chars.
> 
> Thanks, any info you can share would be much appreciated,

This was intentional. There was a long discussion of this in January and 
February of 2014 if you want more background.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

