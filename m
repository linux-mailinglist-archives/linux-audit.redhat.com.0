Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 975F768680D
	for <lists+linux-audit@lfdr.de>; Wed,  1 Feb 2023 15:16:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675260970;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+b0iaab/7m0Wqd7FErLizEwpbaU/K9UsMWNVT4YYbnc=;
	b=adNWuhnFZBPqqVFla2zJRvaAxteVgsEzx7K/WdCk3n9yWNohoFUlm45j2CoTEhC5An7ydf
	b+AUhx0q2VJnjXG2gDn7YRDykK2xNVoqrVEiS1x9EK9pvGy7Ntl5y1GN0iUZL0+jfQIBxZ
	sYOcp8WWsEhjZXusy6+E3MpVFAyr9U0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-uaAxRxZON5aZ6FnQm38I7Q-1; Wed, 01 Feb 2023 09:16:06 -0500
X-MC-Unique: uaAxRxZON5aZ6FnQm38I7Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D304A1C07824;
	Wed,  1 Feb 2023 14:15:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A5308140EBF4;
	Wed,  1 Feb 2023 14:15:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4C6181946A40;
	Wed,  1 Feb 2023 14:15:43 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B6FA11946587 for <linux-audit@listman.corp.redhat.com>;
 Wed,  1 Feb 2023 00:48:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 62E7A112132D; Wed,  1 Feb 2023 00:48:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AC40112132C
 for <linux-audit@redhat.com>; Wed,  1 Feb 2023 00:48:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3ABE3183B3C1
 for <linux-audit@redhat.com>; Wed,  1 Feb 2023 00:48:58 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
 relay.mimecast.com with ESMTP id us-mta-94-UEY95R3aPWyeqPA7U4tMtA-1; Tue,
 31 Jan 2023 19:48:53 -0500
X-MC-Unique: UEY95R3aPWyeqPA7U4tMtA-1
Received: by linux.microsoft.com (Postfix, from userid 1052)
 id 6F5F120E0A00; Tue, 31 Jan 2023 16:48:52 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6F5F120E0A00
Date: Tue, 31 Jan 2023 16:48:52 -0800
From: Fan Wu <wufan@linux.microsoft.com>
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [RFC PATCH v9 00/16] Integrity Policy Enforcement LSM (IPE)
Message-ID: <20230201004852.GB30104@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <033335b26f6becdc3dc0325ef926efd94fcc4dda.camel@huaweicloud.com>
MIME-Version: 1.0
In-Reply-To: <033335b26f6becdc3dc0325ef926efd94fcc4dda.camel@huaweicloud.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Wed, 01 Feb 2023 14:15:41 +0000
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, tytso@mit.edu,
 dm-devel@redhat.com, corbet@lwn.net, roberto.sassu@huawei.com,
 linux-doc@vger.kernel.org, snitzer@kernel.org, jmorris@namei.org,
 zohar@linux.ibm.com, linux-kernel@vger.kernel.org, ebiggers@kernel.org,
 linux-security-module@vger.kernel.org, linux-audit@redhat.com,
 eparis@redhat.com, linux-fscrypt@vger.kernel.org,
 linux-integrity@vger.kernel.org, agk@redhat.com, serge@hallyn.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 31, 2023 at 03:22:05PM +0100, Roberto Sassu wrote:
> On Mon, 2023-01-30 at 14:57 -0800, Fan Wu wrote:
> > IPE has two known gaps:
> > 
> > 1. IPE cannot verify the integrity of anonymous executable memory, such as
> >   the trampolines created by gcc closures and libffi (<3.4.2), or JIT'd code.
> >   Unfortunately, as this is dynamically generated code, there is no way
> >   for IPE to ensure the integrity of this code to form a trust basis. In all
> >   cases, the return result for these operations will be whatever the admin
> >   configures the DEFAULT action for "EXECUTE".
> 
> I think it would be useful to handle special cases, for example you
> could allow a process that created a file with memfd to use it, at the
> condition that nobody else writes it.
> 
> This would be required during the boot, otherwise services could fail
> to start (depending on the policy).
> 
Thanks for the suggestion. I agree with your opinion and I think supporting
memfd is possible but restricting read/write needs more hooks. We would like
to avoid adding more complexity to this initial posting as necessary. 
We will consider this as a future work and will post follow-on patches
in the future.

-Fan

> > 2. IPE cannot verify the integrity of interpreted languages' programs when
> >   these scripts invoked via ``<interpreter> <file>``. This is because the
> >   way interpreters execute these files, the scripts themselves are not
> >   evaluated as executable code through one of IPE's hooks. Interpreters
> >   can be enlightened to the usage of IPE by trying to mmap a file into
> >   executable memory (+X), after opening the file and responding to the
> >   error code appropriately. This also applies to included files, or high
> >   value files, such as configuration files of critical system components.
> 
> Ok, it is a well known issue. Hopefully, it will be fixed soon.
> 
> Roberto
> 

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

