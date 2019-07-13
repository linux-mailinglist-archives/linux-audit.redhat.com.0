Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0875B67ACF
	for <lists+linux-audit@lfdr.de>; Sat, 13 Jul 2019 17:09:15 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BBC7930C0DE6;
	Sat, 13 Jul 2019 15:09:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 555581001B02;
	Sat, 13 Jul 2019 15:09:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ACD9341F40;
	Sat, 13 Jul 2019 15:09:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6DF8l7T017256 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 13 Jul 2019 11:08:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C270E5C260; Sat, 13 Jul 2019 15:08:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-23.phx2.redhat.com [10.3.116.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 197CA5F724;
	Sat, 13 Jul 2019 15:08:42 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: Preferred subj= with multiple LSMs
Date: Sat, 13 Jul 2019 11:08:41 -0400
Message-ID: <2268017.8MBUnBNn7u@x2>
Organization: Red Hat
In-Reply-To: <f824828c-5c9d-b91e-5cec-70ee7a45e760@schaufler-ca.com>
References: <f824828c-5c9d-b91e-5cec-70ee7a45e760@schaufler-ca.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: rgb@redhat.com,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Sat, 13 Jul 2019 15:09:13 +0000 (UTC)

Hello,

On Friday, July 12, 2019 12:33:55 PM EDT Casey Schaufler wrote:
> Which of these options would be preferred for audit records
> when there are multiple active security modules?

I'd like to start out with what is the underlying problem that results in 
this? For example, we have pam. It has multiple modules each having a vote. 
If a module votes no, then we need to know who voted no and maybe why. We 
normally do not need to know who voted yes.

So, in a stacked situation, shouldn't each module make its own event, if 
required, just like pam? And then log the attributes as it knows them? Also, 
what model is being used? Does first module voting no end access voting? Or 
does each module get a vote even if one has already said no?

Also, we try to keep LSM subsystems separated by record type numbers. So, 
apparmour and selinux events are entirely different record numbers and 
formats. Combining everything into one record is going to be problematic for 
reporting.

-Steve

> I'm not asking
> if we should do it, I'm asking which of these options I should
> implement when I do do it. I've prototyped #1 and #2. #4 is a
> minor variant of #1 that is either better for compatibility or
> worse, depending on how you want to look at it. I understand
> that each of these offer challenges. If I've missed something
> obvious, I'd be delighted to consider #5.
> 
> Thank you.
> 
> Option 1:
> 
> 	subj=selinux='x:y:z:s:c',apparmor='a'
> 
> Option 2:
> 
> 	subj=x:y:z:s:c subj=a
> 
> Option 3:
> 
> 	lsms=selinux,apparmor subj=x:y:z:s:c subj=a
> 
> Option 4:
> 
> 	subjs=selinux='x:y:z:s:c',apparmor='a'
> 
> Option 5:
> 
> 	Something else.




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
