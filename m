Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA7127473A
	for <lists+linux-audit@lfdr.de>; Tue, 22 Sep 2020 19:06:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600794393;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=s+7oA5JW0ldHSZyh+ofPIpzZpjyiufb5IhS01Lk/LYk=;
	b=Nnfa9GvNo9TpNoF4RIN06QxgiJbkR8RPzXrCw6M8EhQVm+AhKmIqN17lXe58BdCe+R2zQd
	Yjs2CgxQIqJYhlguwOd34W+NJNCYnVv8j65GdqyQqr4wbk0N7qYOCumARVxYTcDV2UJQUZ
	jMCvExXqj4AYVFzOeQA6n6FOkFBNKLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-6wf-uLJGPQySlhp7TEVQig-1; Tue, 22 Sep 2020 13:06:28 -0400
X-MC-Unique: 6wf-uLJGPQySlhp7TEVQig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CC98873110;
	Tue, 22 Sep 2020 17:06:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9272419D61;
	Tue, 22 Sep 2020 17:06:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 39B0718A1996;
	Tue, 22 Sep 2020 17:06:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08MH64OW017345 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 22 Sep 2020 13:06:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 261C173670; Tue, 22 Sep 2020 17:06:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-231.rdu2.redhat.com [10.10.116.231])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C1AFF614F5;
	Tue, 22 Sep 2020 17:06:00 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: Re: augenrules --load
Date: Tue, 22 Sep 2020 13:06:00 -0400
Message-ID: <4590690.31r3eYUQgx@x2>
Organization: Red Hat
In-Reply-To: <738651663.5183625.1600783983768@mail.yahoo.com>
References: <738651663.5183625.1600783983768.ref@mail.yahoo.com>
	<738651663.5183625.1600783983768@mail.yahoo.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

This email is formatted very badly. I will try to answer it.

On Tuesday, September 22, 2020 10:13:03 AM EDT Joe Wulf wrote:
> When building a new RHEL v7.8 VM manually, I set up the rules desired in
> /etc/audit/rulesd/audit.rules, no other changes (because I've wanted to
> narrow down the issue). After subsequent reboots, with no further changes
> to any audit rules either; I monitor /var/log/messages and I see
> occurrences like this: Sep 22 09:04:24 hostxyz augenrules:
> /sbin/augenrules: No change

This is normal.

> Sep 22 09:04:24 hostxyz augenrules: No rulesSep 22 09:04:24 hostxyz
> augenrules: enabled 1Sep 22 09:04:24 hostxyz augenrules: failure 1Sep 22
> 09:04:24 hostxyz augenrules: pid 1242Sep 22 09:04:24 hostxyz augenrules:
> rate_limit 0Sep 22 09:04:24 hostxyz augenrules: backlog_limit 16384Sep 22
> 09:04:24 hostxyz augenrules: lost 56Sep 22 09:04:24 hostxyz augenrules:
> backlog 1Sep 22 09:04:24 hostxyz augenrules: enabled 1Sep 22 09:04:24
> hostxyz augenrules: failure 2Sep 22 09:04:24 hostxyz augenrules: pid
> 1242Sep 22 09:04:24 hostxyz augenrules: rate_limit 0Sep 22 09:04:24
> hostxyz augenrules: backlog_limit 16384Sep 22 09:04:24 hostxyz augenrules:
> lost 56Sep 22 09:04:24 hostxyz augenrules: backlog 0Sep 22 09:04:24
> hostxyz augenrules: usage: auditctl [options]Sep 22 09:04:24 hostxyz
> augenrules: -a <l,a>            Append rule to end of <l>ist with
> <a>ctionSep 22 09:04:24 hostxyz augenrules: -A <l,a>            Add rule
> at beginning of <l>ist with <a>ctionSep 22 09:04:24 hostxyz augenrules: -b
> <backlog>        Set max number of outstanding audit buffersSep 22
> 09:04:24 hostxyz augenrules: allowed Default=64Sep 22 09:04:24 hostxyz
> augenrules: -c                  Continue through errors in rulesSep 22
> 09:04:24 hostxyz augenrules: -C f=f              Compare collected fields
> if available:Sep 22 09:04:24 hostxyz augenrules: Field name,
> operator(=,!=), field nameSep 22 09:04:24 hostxyz augenrules: -d
> <l,a>            Delete rule from <l>ist with <a>ctionSep 22 09:04:24
> hostxyz augenrules: l=task,exit,user,excludeSep 22 09:04:24 hostxyz
> augenrules: a=never,alwaysSep 22 09:04:24 hostxyz augenrules:
> -D                  Delete all rules and watchesSep 22 09:04:24 hostxyz
> augenrules: -e [0..2]           Set enabled flagSep 22 09:04:24 hostxyz
> augenrules: -f [0..2]           Set failure flagSep 22 09:04:24 hostxyz
> augenrules: 0=silent 1=printk 2=panicSep 22 09:04:24 hostxyz augenrules:
> -F f=v              Build rule: field name, operator(=,!=,<,>,<=,Sep 22
> 09:04:24 hostxyz augenrules: >=,&,&=) valueSep 22 09:04:24 hostxyz
> augenrules: -h                  HelpSep 22 09:04:24 hostxyz augenrules:
> -i                  Ignore errors when reading rules from fileSep 22
> 09:04:24 hostxyz augenrules: -k <key>            Set filter key on audit
> ruleSep 22 09:04:24 hostxyz augenrules: -l                  List rulesSep
> 22 09:04:24 hostxyz augenrules: -m text             Send a user-space
> messageSep 22 09:04:24 hostxyz augenrules: -p [r|w|x|a]        Set
> permissions filter on watchSep 22 09:04:24 hostxyz augenrules: r=read,
> w=write, x=execute, a=attributeSep 22 09:04:24 hostxyz augenrules: -q
> <mount,subtree>  make subtree part of mount point's dir watchesSep 22
> 09:04:24 hostxyz augenrules: -r <rate>           Set limit in messages/sec
> (0=none)Sep 22 09:04:24 hostxyz augenrules: -R <file>           read rules
> from fileSep 22 09:04:24 hostxyz augenrules: -s                  Report
> statusSep 22 09:04:24 hostxyz augenrules: -S syscall          Build rule:
> syscall name or numberSep 22 09:04:24 hostxyz augenrules:
> -t                  Trim directory watchesSep 22 09:04:24 hostxyz
> augenrules: -v                  VersionSep 22 09:04:24 hostxyz augenrules:
> -w <path>           Insert watch at <path>Sep 22 09:04:24 hostxyz
> augenrules: -W <path>           Remove watch at <path>Sep 22 09:04:24
> hostxyz augenrules: --loginuid-immutable  Make loginuids unchangeable once
> setSep 22 09:04:24 hostxyz augenrules: --reset-lost         Reset the lost
> record counterSep 22 09:04:24 hostxyz systemd: Started Security Auditing
> Service. The 'usage' of auditctl is invoked the one time in the 'try_load'
> function of augenrules.  Manual executions of "/sbin/auditctl -R
> /etc/audit/audit.rules', results in essentially the same behavior on the
> terminal as found in /var/log/messages. Should execution of augenrules
> seemingly error-out on invocation of auditctl like this? 

It should be telling you which line it didn't like. That is unless you have a 
"-h" in the rules. Or an option that doesn't match. You should look over the 
rules carefully. Something in there is a typo.

I revised the error message for unmatched options to print the line number 
instead of usage.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

