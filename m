Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 357731AD14F
	for <lists+linux-audit@lfdr.de>; Thu, 16 Apr 2020 22:40:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587069616;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OV3h59kyow/IEawNqbBcABBLaQknRnERo3vGPNwGWLc=;
	b=GK+/zB9XSW4QyQW9AKfHVHdwkY+zxwkSUJ61qYExmZrfffdjwDgEu8xn/lla85pvzIqQw/
	OFi30YETur9+j3dMd1CX6nYzrT/8jO1T/2YaS3X9hYEGx1EYn0lQc+57m0je3sRwQmF4GE
	mKk8VzIc5D4DgZw82o/gcSPhuBJttMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-QjR2gD5vOz2Bszz_twirxQ-1; Thu, 16 Apr 2020 16:40:13 -0400
X-MC-Unique: QjR2gD5vOz2Bszz_twirxQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2103D8017F3;
	Thu, 16 Apr 2020 20:40:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B4136092D;
	Thu, 16 Apr 2020 20:40:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 188A518034EA;
	Thu, 16 Apr 2020 20:39:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03GKaRFK031133 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 16 Apr 2020 16:36:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 24FB02026E1C; Thu, 16 Apr 2020 20:36:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20B672026D66
	for <linux-audit@redhat.com>; Thu, 16 Apr 2020 20:36:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E2708056CE
	for <linux-audit@redhat.com>; Thu, 16 Apr 2020 20:36:25 +0000 (UTC)
Received: from out03.mta.xmission.com (out03.mta.xmission.com
	[166.70.13.233]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-179-Fnd7BckmOiaJd_T3ydSxOg-1; Thu, 16 Apr 2020 16:36:21 -0400
X-MC-Unique: Fnd7BckmOiaJd_T3ydSxOg-1
Received: from in01.mta.xmission.com ([166.70.13.51])
	by out03.mta.xmission.com with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.90_1)
	(envelope-from <ebiederm@xmission.com>)
	id 1jPBF9-0003Wf-Lk; Thu, 16 Apr 2020 14:36:15 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
	helo=x220.xmission.com) by in01.mta.xmission.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
	(envelope-from <ebiederm@xmission.com>)
	id 1jPBF8-0008Kz-Fm; Thu, 16 Apr 2020 14:36:15 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Paul Moore <paul@paul-moore.com>
References: <20200318215550.es4stkjwnefrfen2@madcap2.tricolour.ca>
	<CAHC9VhSdDDP7Ec-w61NhGxZG5ZiekmrBCAg=Y=VJvEZcgQh46g@mail.gmail.com>
	<20200319220249.jyr6xmwvflya5mks@madcap2.tricolour.ca>
	<CAHC9VhR84aN72yNB_j61zZgrQV1y6yvrBLNY7jp7BqQiEDL+cw@mail.gmail.com>
	<20200324210152.5uydf3zqi3dwshfu@madcap2.tricolour.ca>
	<CAHC9VhTQUnVhoN3JXTAQ7ti+nNLfGNVXhT6D-GYJRSpJHCwDRg@mail.gmail.com>
	<20200330134705.jlrkoiqpgjh3rvoh@madcap2.tricolour.ca>
	<CAHC9VhQTsEMcYAF1CSHrrVn07DR450W9j6sFVfKAQZ0VpheOfw@mail.gmail.com>
	<20200330162156.mzh2tsnovngudlx2@madcap2.tricolour.ca>
	<CAHC9VhTRzZXJ6yUFL+xZWHNWZFTyiizBK12ntrcSwmgmySbkWw@mail.gmail.com>
	<20200330174937.xalrsiev7q3yxsx2@madcap2.tricolour.ca>
	<CAHC9VhR_bKSHDn2WAUgkquu+COwZUanc0RV3GRjMDvpoJ5krjQ@mail.gmail.com>
Date: Thu, 16 Apr 2020 15:33:13 -0500
In-Reply-To: <CAHC9VhR_bKSHDn2WAUgkquu+COwZUanc0RV3GRjMDvpoJ5krjQ@mail.gmail.com>
	(Paul Moore's message of "Mon, 30 Mar 2020 15:55:36 -0400")
Message-ID: <871ronf9x2.fsf@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1jPBF8-0008Kz-Fm; ; ; mid=<871ronf9x2.fsf@x220.int.ebiederm.org>;
	; ; hst=in01.mta.xmission.com; ; ; ip=68.227.160.95; ; ;
	frm=ebiederm@xmission.com; ; ; spf=neutral
X-XM-AID: U2FsdGVkX18QCbICEec/DdkpMxCQSiOIlOx7aNlCCNU=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa05.xmission.com
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=8.0 tests=ALL_TRUSTED,BAYES_50,
	DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,XMSlimDrugH,XMSubLong
	autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.4839] *  0.7 XMSubLong Long Subject
	*  1.0 XMSlimDrugH Weight loss drug headers
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa05 1397; Body=1 Fuz1=1 Fuz2=1]
X-Spam-DCC: XMission; sa05 1397; Body=1 Fuz1=1 Fuz2=1
X-Spam-Combo: *;Paul Moore <paul@paul-moore.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 436 ms - load_scoreonly_sql: 0.05 (0.0%),
	signal_user_changed: 13 (2.9%), b_tie_ro: 11 (2.5%), parse: 1.53
	(0.4%), extract_message_metadata: 19 (4.2%), get_uri_detail_list: 3.2
	(0.7%), tests_pri_-1000: 19 (4.3%), tests_pri_-950: 1.66 (0.4%),
	tests_pri_-900: 1.33 (0.3%), tests_pri_-90: 67 (15.3%), check_bayes:
	65 (14.9%), b_tokenize: 11 (2.5%), b_tok_get_all: 8 (1.9%),
	b_comp_prob: 2.9 (0.7%), b_tok_touch_all: 40 (9.1%), b_finish: 0.79
	(0.2%), tests_pri_0: 296 (68.0%), check_dkim_signature: 0.77 (0.2%),
	check_dkim_adsp: 3.1 (0.7%), poll_dns_idle: 0.23 (0.1%), tests_pri_10:
	3.5 (0.8%), tests_pri_500: 10 (2.3%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
X-Spam-Flag: No
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03GKaRFK031133
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 16 Apr 2020 16:39:51 -0400
Cc: nhorman@tuxdriver.com, Richard Guy Briggs <rgb@redhat.com>,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	linux-audit@redhat.com, netfilter-devel@vger.kernel.org,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Paul Moore <paul@paul-moore.com> writes:

> On Mon, Mar 30, 2020 at 1:49 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>> On 2020-03-30 13:34, Paul Moore wrote:
>> > On Mon, Mar 30, 2020 at 12:22 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>> > > On 2020-03-30 10:26, Paul Moore wrote:
>> > > > On Mon, Mar 30, 2020 at 9:47 AM Richard Guy Briggs <rgb@redhat.com> wrote:
>> > > > > On 2020-03-28 23:11, Paul Moore wrote:
>> > > > > > On Tue, Mar 24, 2020 at 5:02 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>> > > > > > > On 2020-03-23 20:16, Paul Moore wrote:
>> > > > > > > > On Thu, Mar 19, 2020 at 6:03 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>> > > > > > > > > On 2020-03-18 18:06, Paul Moore wrote:
>
> ...
>
>> > > Well, every time a record gets generated, *any* record gets generated,
>> > > we'll need to check for which audit daemons this record is in scope and
>> > > generate a different one for each depending on the content and whether
>> > > or not the content is influenced by the scope.
>> >
>> > That's the problem right there - we don't want to have to generate a
>> > unique record for *each* auditd on *every* record.  That is a recipe
>> > for disaster.
>> >
>> > Solving this for all of the known audit records is not something we
>> > need to worry about in depth at the moment (although giving it some
>> > casual thought is not a bad thing), but solving this for the audit
>> > container ID information *is* something we need to worry about right
>> > now.
>>
>> If you think that a different nested contid value string per daemon is
>> not acceptable, then we are back to issuing a record that has only *one*
>> contid listed without any nesting information.  This brings us back to
>> the original problem of keeping *all* audit log history since the boot
>> of the machine to be able to track the nesting of any particular contid.
>
> I'm not ruling anything out, except for the "let's just completely
> regenerate every record for each auditd instance".

Paul I am a bit confused about what you are referring to when you say
regenerate every record.

Are you saying that you don't want to repeat the sequence:
	audit_log_start(...);
	audit_log_format(...);
	audit_log_end(...);
for every nested audit daemon?

Or are you saying that you would like to literraly want to send the same
skb to each of the nested audit daemons?

Or are you thinking of something else?

Eric


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

