Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D13EF29F279
	for <lists+linux-audit@lfdr.de>; Thu, 29 Oct 2020 18:01:33 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-FM1UFTb2NjGVoO50iWnQjw-1; Thu, 29 Oct 2020 13:01:30 -0400
X-MC-Unique: FM1UFTb2NjGVoO50iWnQjw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0840C806B44;
	Thu, 29 Oct 2020 17:00:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6CAD194BD;
	Thu, 29 Oct 2020 17:00:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 80CA9181A06B;
	Thu, 29 Oct 2020 17:00:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09TGbqIV001841 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 29 Oct 2020 12:37:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 526A6114F0BF; Thu, 29 Oct 2020 16:37:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C64310F8E1F
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 16:37:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2B9E1021F73
	for <linux-audit@redhat.com>; Thu, 29 Oct 2020 16:37:45 +0000 (UTC)
Received: from out03.mta.xmission.com (out03.mta.xmission.com
	[166.70.13.233]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-477-RyeSAqtkPNGs3n2oABR78Q-1; Thu, 29 Oct 2020 12:37:41 -0400
X-MC-Unique: RyeSAqtkPNGs3n2oABR78Q-1
Received: from in01.mta.xmission.com ([166.70.13.51])
	by out03.mta.xmission.com with esmtps (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1kYAvU-00C748-2E; Thu, 29 Oct 2020 10:37:24 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
	helo=x220.xmission.com) by in01.mta.xmission.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
	(envelope-from <ebiederm@xmission.com>)
	id 1kYAvS-0008Bk-Sf; Thu, 29 Oct 2020 10:37:23 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Aleksa Sarai <cyphar@cyphar.com>
References: <20201029003252.2128653-1-christian.brauner@ubuntu.com>
	<87pn51ghju.fsf@x220.int.ebiederm.org>
	<20201029155148.5odu4j2kt62ahcxq@yavin.dot.cyphar.com>
Date: Thu, 29 Oct 2020 11:37:23 -0500
In-Reply-To: <20201029155148.5odu4j2kt62ahcxq@yavin.dot.cyphar.com> (Aleksa
	Sarai's message of "Fri, 30 Oct 2020 02:51:48 +1100")
Message-ID: <87361xdm4c.fsf@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1kYAvS-0008Bk-Sf; ; ; mid=<87361xdm4c.fsf@x220.int.ebiederm.org>;
	; ; hst=in01.mta.xmission.com; ; ; ip=68.227.160.95; ; ;
	frm=ebiederm@xmission.com; ; ; spf=neutral
X-XM-AID: U2FsdGVkX180W5DqIedhnPmHhxEi5hPqd4yVVQ9Dudw=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa06.xmission.com
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=8.0 tests=ALL_TRUSTED,BAYES_50,
	DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,XMNoVowels,
	XM_Body_Dirty_Words autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.5000]
	*  1.5 XMNoVowels Alpha-numberic number with no vowels
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa06 1397; Body=1 Fuz1=1 Fuz2=1]
	*  0.5 XM_Body_Dirty_Words Contains a dirty word
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1
X-Spam-Combo: *;Aleksa Sarai <cyphar@cyphar.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 703 ms - load_scoreonly_sql: 0.07 (0.0%),
	signal_user_changed: 11 (1.6%), b_tie_ro: 10 (1.4%), parse: 1.76
	(0.3%), extract_message_metadata: 27 (3.9%), get_uri_detail_list: 3.4
	(0.5%), tests_pri_-1000: 29 (4.2%), tests_pri_-950: 1.71 (0.2%),
	tests_pri_-900: 1.59 (0.2%), tests_pri_-90: 164 (23.3%), check_bayes:
	143 (20.3%), b_tokenize: 23 (3.2%), b_tok_get_all: 13 (1.9%),
	b_comp_prob: 5 (0.8%), b_tok_touch_all: 97 (13.7%), b_finish: 1.01
	(0.1%), tests_pri_0: 448 (63.8%), check_dkim_signature: 0.80 (0.1%),
	check_dkim_adsp: 7 (1.0%), poll_dns_idle: 0.33 (0.0%), tests_pri_10:
	3.2 (0.4%), tests_pri_500: 9 (1.3%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH 00/34] fs: idmapped mounts
X-Spam-Flag: No
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 29 Oct 2020 12:57:25 -0400
Cc: Phil Estes <estesp@gmail.com>, Lennart Poettering <lennart@poettering.net>,
	Amir Goldstein <amir73il@gmail.com>, Zohar <zohar@linux.ibm.com>,
	Howells <dhowells@redhat.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
	containers@lists.linux-foundation.org,
	Christian Brauner <christian.brauner@ubuntu.com>,
	Tycho Andersen <tycho@tycho.ws>, Miklos Szeredi <miklos@szeredi.hu>,
	James Morris <jmorris@namei.org>, smbarber@chromium.org,
	Christoph Hellwig <hch@infradead.org>, Andy,
	linux-ext4@vger.kernel.org, Mrunal Patel <mpatel@redhat.com>,
	Serge Hallyn <serge@hallyn.com>, Arnd Bergmann <arnd@arndb.de>,
	Jann Horn <jannh@google.com>, selinux@vger.kernel.org,
	Josh Triplett <josh@joshtriplett.org>, Alban,
	linux-fsdevel@vger.kernel.org, =?utf-8?Q?St=C3=A9phane?=,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Lutomirski <luto@kernel.org>, Mimi,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Geoffrey Thomas <geofft@ldpreload.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	John Johansen <john.johansen@canonical.com>, Theodore Tso <tytso@mit.edu>,
	Seth Forshee <seth.forshee@canonical.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-unionfs@vger.kernel.org,
	David, linux-security-module@vger.kernel.org,
	linux-audit@redhat.com, linux-api@vger.kernel.org,
	Crequy <alban@kinvolk.io>, linux-integrity@vger.kernel.org,
	Graber <stgraber@ubuntu.com>, Todd Kjos <tkjos@google.com>
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

Aleksa Sarai <cyphar@cyphar.com> writes:

> On 2020-10-29, Eric W. Biederman <ebiederm@xmission.com> wrote:
>> Christian Brauner <christian.brauner@ubuntu.com> writes:
>> 
>> > Hey everyone,
>> >
>> > I vanished for a little while to focus on this work here so sorry for
>> > not being available by mail for a while.
>> >
>> > Since quite a long time we have issues with sharing mounts between
>> > multiple unprivileged containers with different id mappings, sharing a
>> > rootfs between multiple containers with different id mappings, and also
>> > sharing regular directories and filesystems between users with different
>> > uids and gids. The latter use-cases have become even more important with
>> > the availability and adoption of systemd-homed (cf. [1]) to implement
>> > portable home directories.
>> 
>> Can you walk us through the motivating use case?
>> 
>> As of this year's LPC I had the distinct impression that the primary use
>> case for such a feature was due to the RLIMIT_NPROC problem where two
>> containers with the same users still wanted different uid mappings to
>> the disk because the users were conflicting with each other because of
>> the per user rlimits.
>> 
>> Fixing rlimits is straight forward to implement, and easier to manage
>> for implementations and administrators.
>
> This is separate to the question of "isolated user namespaces" and
> managing different mappings between containers. This patchset is solving
> the same problem that shiftfs solved -- sharing a single directory tree
> between containers that have different ID mappings. rlimits (nor any of
> the other proposals we discussed at LPC) will help with this problem.

First and foremost: A uid shift on write to a filesystem is a security
bug waiting to happen.  This is especially in the context of facilities
like iouring, that play very agressive games with how process context
makes it to  system calls.

The only reason containers were not immediately exploitable when iouring
was introduced is because the mechanisms are built so that even if
something escapes containment the security properties still apply.
Changes to the uid when writing to the filesystem does not have that
property.  The tiniest slip in containment will be a security issue.

This is not even the least bit theoretical.  I have seem reports of how
shitfs+overlayfs created a situation where anyone could read
/etc/shadow.

If you are going to write using the same uid to disk from different
containers the question becomes why can't those containers configure
those users to use the same kuid?

What fixing rlimits does is it fixes one of the reasons that different
containers could not share the same kuid for users that want to write to
disk with the same uid.


I humbly suggest that it will be more secure, and easier to maintain for
both developers and users if we fix the reasons people want different
containers to have the same user running with different kuids.

If not what are the reasons we fundamentally need the same on-disk user
using multiple kuids in the kernel?

Eric

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

